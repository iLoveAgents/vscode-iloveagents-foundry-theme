"""Sample Python code to showcase Azure AI Foundry Theme syntax highlighting.
Includes: type hints, async/await, context managers, f-strings, dataclasses,
list/dict comprehensions, pattern matching, and Azure AI Foundry (azure-ai-inference) usage.

NOTE: This sample focuses on lexical variety for theme demonstration;
replace placeholder endpoint/model and ensure dependencies are installed:
    pip install azure-ai-inference azure-identity
"""
from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Iterable, AsyncIterator, Literal
import os
import asyncio

from azure.ai.inference import ChatCompletionsClient
from azure.ai.inference.models import SystemMessage, UserMessage, JsonSchemaFormat
from azure.identity import DefaultAzureCredential

# Environment / configuration (placeholder values)
AZURE_INFERENCE_ENDPOINT = os.getenv("AZURE_INFERENCE_ENDPOINT", "https://<resource>.services.ai.azure.com/models")
MODEL = os.getenv("AZURE_MODEL", "gpt-4o-mini")


@dataclass(slots=True)
class Task:
    id: int
    prompt: str
    status: Literal["pending", "running", "done", "error"] = "pending"
    result: str | None = None

    def mark(self, *, status: Literal["pending", "running", "done", "error"], result: str | None = None) -> None:
        self.status = status  # demonstration of instance attribute change with constrained Literal
        self.result = result


def chunk(iterable: Iterable[Any], size: int) -> list[list[Any]]:
    """Split an iterable into chunks for demonstration.
    Shows list comprehension & slicing visuals."""
    data = list(iterable)
    return [data[i : i + size] for i in range(0, len(data), size)]


async def stream_chat(client: ChatCompletionsClient, user_text: str) -> AsyncIterator[str]:
    """Stream a chat completion response using azure-ai-inference.

    Pattern demonstrates async generator + streaming updates if future SDK exposes it.
    Currently we simulate chunking for highlight variety.
    """
    # Simulated streaming (the real SDK provides streaming APIs in preview for some models)
    fake = f"Simulated response for: {user_text}".split()
    for token in fake:
        await asyncio.sleep(0.01)
        yield token + " "


def build_client() -> ChatCompletionsClient:
    # Prefer Entra ID for production (DefaultAzureCredential) to avoid embedding keys.
    credential = DefaultAzureCredential()
    client = ChatCompletionsClient(endpoint=AZURE_INFERENCE_ENDPOINT, credential=credential)
    return client


def structured_json_example(client: ChatCompletionsClient) -> None:
    """Example of requesting structured JSON output with a tiny schema.
    NOTE: Adjust based on actual SDK capabilities; used here for color variety."""
    schema = {
        "name": "Fact",
        "schema": {
            "type": "object",
            "properties": {"summary": {"type": "string"}, "confidence": {"type": "number"}},
            "required": ["summary", "confidence"],
            "additionalProperties": False,
        },
    }
    response = client.complete(
        messages=[
            SystemMessage(content="You output concise fact objects."),
            UserMessage(content="Give one fact about Saturn's rings."),
        ],
        model=MODEL,
        response_format=JsonSchemaFormat(schema=schema, json_schema_format_version="1.0"),
    )
    print("Structured JSON:")
    print(response.choices[0].message.content)


def classify(tasks: list[Task]) -> dict[str, list[int]]:
    """Use structural pattern matching to group tasks by status."""
    groups: dict[str, list[int]] = {}
    for t in tasks:
        match t.status:
            case "pending" | "running" | "done" | "error" as state:
                groups.setdefault(state, []).append(t.id)
            case _:  # fallback branch for highlighting unknown status
                groups.setdefault("unknown", []).append(t.id)
    return groups


async def main() -> None:
    client = build_client()

    # Basic completion
    basic = client.complete(
        messages=[
            SystemMessage(content="You are a helpful assistant."),
            UserMessage(content="In one sentence explain vector embeddings."),
        ],
        model=MODEL,
        temperature=0.4,
        max_output_tokens=128,
    )
    print("Single completion:\n", basic.choices[0].message.content, "\n")

    structured_json_example(client)

    # Simulated streaming
    print("Streaming simulation:")
    async for token in stream_chat(client, "Why is the sky blue?"):
        print(token, end="")
    print("\n")

    # Data structures for additional syntax variety
    tasks = [Task(id=i, prompt=f"Prompt {i}") for i in range(1, 6)]
    for i, task in enumerate(tasks):
        if i % 2 == 0:
            task.mark(status="done", result=f"Result for {task.id}")
        else:
            task.mark(status="running")

    groups = classify(tasks)
    print("Task groups:", groups)

    # Demonstrate comprehension & f-string formatting
    summary_lines = [f"Task {t.id}: {t.status} -> {t.result or 'N/A'}" for t in tasks]
    print("\n".join(summary_lines))


if __name__ == "__main__":
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        print("Interrupted by user")
