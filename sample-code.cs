// Sample C# code to showcase Azure AI Foundry Theme syntax highlighting.
// Includes: file-scoped namespaces, records, pattern matching, LINQ, async/await,
// using directives with aliases, string interpolation, raw string literals, tuples,
// and Azure AI Inference chat completion usage.
//
// NOTE: Replace placeholder endpoint/model. Requires packages (preview versions may change):
//   dotnet add package Azure.AI.Inference --prerelease
//   dotnet add package Azure.Identity

using System;
using System.Collections.Generic;
using System.Collections.Immutable;
using System.CommandLine; // (intentional: for variety; not used)
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading;
using System.Threading.Tasks;

using Azure;
using Azure.AI.Inference;
using Azure.AI.Inference.Models;
using Azure.Core;
using Azure.Core.Pipeline;
using Azure.Identity;

namespace FoundryThemeSample;

public readonly record struct TaskItem(int Id, string Prompt, string Status = "pending", string? Result = null)
{
    public TaskItem With(string? status = null, string? result = null) => this with
    {
        Status = status ?? Status,
        Result = result ?? Result
    };
}

internal static class Program
{
    private static readonly Uri Endpoint = new(Environment.GetEnvironmentVariable("AZURE_INFERENCE_ENDPOINT") ?? "https://<resource>.services.ai.azure.com/models");
    private static readonly string Model = Environment.GetEnvironmentVariable("AZURE_MODEL") ?? "gpt-4o-mini";

    private static ChatCompletionsClient CreateClient()
    {
        var credential = new DefaultAzureCredential();
        var clientOptions = new AzureAIInferenceClientOptions();
        var policy = new BearerTokenAuthenticationPolicy(credential, new[] { "https://cognitiveservices.azure.com/.default" });
        clientOptions.AddPolicy(policy, HttpPipelinePosition.PerRetry);
        return new ChatCompletionsClient(Endpoint, credential, clientOptions);
    }

    private static IEnumerable<TaskItem> SeedTasks() => Enumerable
        .Range(1, 5)
        .Select(i => new TaskItem(i, $"Prompt {i}", i % 2 == 0 ? "done" : "running"));

    private static IReadOnlyDictionary<string, ImmutableArray<int>> GroupTasks(IEnumerable<TaskItem> tasks)
    {
        var dict = new Dictionary<string, List<int>>();
        foreach (var t in tasks)
        {
            var key = t.Status switch
            {
                "pending" or "running" or "done" or "error" => t.Status,
                var other => "unknown" // 'other' intentionally unused variable for highlighting
            };
            dict.TryAdd(key, new List<int>());
            dict[key].Add(t.Id);
        }
        return dict.ToDictionary(kv => kv.Key, kv => kv.Value.ToImmutableArray());
    }

    private static async Task SimpleChatAsync(ChatCompletionsClient client, CancellationToken ct)
    {
        var options = new ChatCompletionsOptions
        {
            Messages =
            {
                new ChatRequestSystemMessage("You are a helpful assistant."),
                new ChatRequestUserMessage("Explain embeddings in one sentence")
            },
            Model = Model,
            MaxOutputTokens = 128,
            Temperature = 0.4f
        };

        Response<ChatCompletions> response = client.Complete(options, ct);
        Console.WriteLine($"Basic completion:\n{response.Value.Content}\n");
    }

    private static async Task SimulatedStreamAsync(ChatCompletionsClient client)
    {
        // Simulated streaming for theme variety (replace with CompleteStreamingAsync when appropriate)
        string text = "Simulated streaming response for: Why is the sky blue?";
        foreach (var token in text.Split(' '))
        {
            await Task.Delay(15);
            Console.Write(token + ' ');
        }
        Console.WriteLine();
    }

    private static void StructuredJsonExample(ChatCompletionsClient client)
    {
        // NOTE: Example schema for demonstration only; adjust based on current SDK structured output features.
        var schema = new
        {
            name = "Fact",
            schema = new
            {
                type = "object",
                properties = new
                {
                    summary = new { type = "string" },
                    confidence = new { type = "number" }
                },
                required = new[] { "summary", "confidence" },
                additionalProperties = false
            }
        };

        var options = new ChatCompletionsOptions
        {
            Messages =
            {
                new ChatRequestSystemMessage("You output concise fact objects."),
                new ChatRequestUserMessage("Give me one fact about Europa.")
            },
            Model = Model,
        };

        // For illustration: adding additional properties (SDK may expose specialized objects in future versions)
        options.AdditionalProperties["response_format"] = BinaryData.FromObjectAsJson(new
        {
            type = "json_schema",
            json_schema = schema,
            json_schema_format_version = "1.0"
        });

        var resp = client.Complete(options);
        Console.WriteLine("Structured JSON:\n" + resp.Value.Content);
    }

    public static async Task Main()
    {
        using var client = CreateClient();
        using var cts = new CancellationTokenSource(TimeSpan.FromSeconds(30));

        await SimpleChatAsync(client, cts.Token);
        StructuredJsonExample(client);
        Console.WriteLine("Streaming simulation:");
        await SimulatedStreamAsync(client);

        var tasks = SeedTasks().ToList();
        var groups = GroupTasks(tasks);

        Console.WriteLine("Task groups: " + JsonSerializer.Serialize(groups));
        foreach (var t in tasks)
        {
            Console.WriteLine($"Task {t.Id}: {t.Status} -> {t.Result ?? "N/A"}");
        }
    }
}
