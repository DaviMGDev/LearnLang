# SPEC.md as Bootstrap File

**Date:** 2025-07-16

## Topic

Reframing the LearnLang repository around `SPEC.md` as the sole source of truth — deleting all existing language content and restarting from scratch, with the spec serving as a bootstrap document from which the entire ecosystem can be reproduced.

## Key Points

- The user wants to delete `LearnGerman/`, `LearnEsperanto/`, and possibly `LearnLang.md` — keeping only `SPEC.md` as the seed.
- `SPEC.md` should be a bootstrap file: hand it to someone (or an agent) and they produce the entire `LearnLang/` ecosystem faithfully without needing external context.
- The current spec works well in parts (compiler, PDF builder, tools) but relies on tacit knowledge in others (content generation, progression details, format conventions).
- There's an unevenness — some sections are bootstrap-ready, others assume the reader shares the author's intuitions about what makes good learning content.

## Discussion

### Wiping the slate clean

The user wants to strip the repo down to just `SPEC.md` and start fresh, building everything from scratch based on the spec. The existing language folders are artifacts of an earlier, less structured approach, and rather than retrofitting them to match the spec, they'd be deleted entirely. This changes the meaning of the spec's migration path (§9) — it becomes historical reference, not an action plan.

### The spec as bootstrap vs. the spec as documentation

A key distinction emerged: the current `SPEC.md` was written as a formalisation of an existing project. But the user wants it to function as a bootstrap file — a document complete enough that a consumer (human or AI agent) could reproduce the entire ecosystem from nothing. The difference:

| Current spec (documentation) | Bootstrap spec (blueprint) |
|------------------------------|---------------------------|
| Describes what exists | Describes what to build |
| Migration path assumes retrofitting | No migration — ground zero |
| Content patterns show examples but not generation rules | Would need to specify how to generate items, what makes a good phrase, quantities |
| CEFR progression maps topics loosely to files | Would need tighter binding between topic and content format |
| Some conventions (stories, dialogues) mentioned but underspecified | Would need explicit formats for each content type |

### Where the spec is already strong

The compiler spec (§5) was called out as appropriately precise — it handles edge cases, sort order, heading validation. The PDF builder (§6) follows the same level of detail. These sections could be handed to someone and they'd build the right thing.

### Where the spec relies on tacit knowledge

- **Content patterns (§4)**: Pattern A shows "item1, item2, item3" and "short phrase using item1" — but what makes a good phrase? How many per item? What are the bounds? An agent producing content would need to guess.
- **CEFR progression (§3)**: "Functional dialogues" could mean two lines or twenty. "Short texts" could be three sentences or a paragraph. The spec says "stories must be included" but doesn't define what a story looks like in this format.
- **MKF frontmatter interaction**: When `type: story` is used, does that change how the body should be structured compared to `type: vocabulary`? The frontmatter types are listed but their implications on body format aren't spelled out.

### The implicit question

The user was asked: does the spec need to be so complete that an agent could produce the whole ecosystem, or clear enough that *you* know what to build? The answer was the former — the spec should be fully descriptive of the system, a true bootstrap file. This raises the question of how far to push explicitness: should the spec define the exact number of example phrases per vocabulary item, or keep some authorial freedom?

## Conclusions / Decisions

None reached — the discussion was exploratory. Direction is clear (spec as bootstrap, wipe the repo) but specifics remain open.

## Open Questions / Unresolved Threads

- Should `LearnLang.md` be kept or deleted alongside the language folders?
- What's the right level of explicitness for content generation rules (word lists, example phrases, story structure)?
- Should the frontmatter schema prescribe different body structures per `type` value?
- How much authorial freedom should remain for whoever builds the actual content?
- Does §9 (Migration Path) become a design record or get removed entirely?
- The discussion was paused — the user will continue later.

## Follow-ups

- Continue the discussion about how to make SPEC.md a complete bootstrap file.
