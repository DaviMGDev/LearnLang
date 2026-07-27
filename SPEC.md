# LearnLang — Specification

> Status: In specification

## 1. Context

### Problem statement

Existing language-learning materials overemphasise grammar explanations, written exercises, and active recall drills. Learners who want **passive exposure** — to hear the language and absorb its rhythm without studying — have no structured, TTS‑first, input‑only curriculum that scales across languages.

### Target audience

- **Language learners** who want a pure‑input, listen‑while‑commuting method.
- **Content creators / AI agents** who want to scaffold a new language book from a canonical template.

### Domain boundaries

#### In scope

- A filesystem‑based template for authoring language‑learning books.
- A compiler that concatenates a book folder into a single TTS‑ready Markdown file.
- Content patterns (A / B / C) for vocabulary, different‑script, and number sections.
- A CEFR‑aligned progression (starting with A1 Breakthrough).
- MKF (My Knowledge Format) compliance of the repository.
- Agent skills for scaffolding new language books.
- CLI tools for compilation and PDF generation with per‑page language metadata.

#### Out of scope

- Exercises, quizzes, or active recall mechanics.
- Grammar explanations or translations within the book content.
- A mobile app or web platform — this is a file‑based template.
- Spaced‑repetition scheduling or SRS integration.
- Audio generation itself — TTS is an external tool consuming the output.

### Goals

| # | Goal | Success metric | Target phase |
|---|------|----------------|--------------|
| 1 | Single canonical template for any language | A `Learn<Lang>/` folder can be authored by following one spec | v1 |
| 2 | CEFR‑aligned progression from A1 upward | Each CEFR level maps to a folder hierarchy (A1/, A2/, …) | v1 |
| 3 | MKF‑compliant repository | Every content file has valid YAML frontmatter; folders with index.md form compound nodes | v1 |
| 4 | Compiler produces TTS‑ready Markdown | `compiler.sh LearnGerman/` → valid `LearnGerman.md` with demoted headings and `---` separators | v1 (done) |
| 5 | PDF builder respects per‑page language tags | Each PDF page declares its language in metadata so TTS selects the correct voice | v2 |
| 6 | Agent skill for scaffolding new languages | `Learn<Lang>` scaffolding skill exists and can translate from a LearnEnglish template | v2 |

### Non-goals

| # | Non-goal | Rationale | Revisit? |
|---|----------|-----------|----------|
| 1 | Interactive exercises | Contradicts pure‑input philosophy | If users request active recall |
| 2 | Spaced‑repetition scheduling | Out of scope — this is content, not a study app | If integrated with external SRS |
| 3 | Audio generation | TTS engines evolve independently; this project produces text only | Never — keep the boundary |
| 4 | Non‑A1 CEFR levels before v2 | A1 is the foundation; validate the system before expanding | After v1 stabilises |

### Key assumptions

- The content is consumed primarily through TTS playback (commuting, chores, walking).
- File names stay in English regardless of the target language — only the `.md` body is translated.
- Volumes 00–07 (the universal volumes) are semantically identical across languages — translated item‑for‑item.
- `lang_specific/` is rewritten from scratch per language.
- The compiler relies on filesystem sort order for section sequencing — numbered prefixes enforce order.
- Every `.md` file must start with a `# ` heading line.

### Project phase

**Extension** — `compiler.sh` exists and two language books (German, Esperanto) are complete. The structure, metadata, MKF compliance, tools, and higher CEFR levels are being formalised.

---

## 2. Repository Structure

### Root layout

```
LearnLang/
├── SPEC.md                     # This specification
├── AGENTS.md                   # AI behaviour instructions for scaffolding new languages
├── README.md                   # Project overview
├── compiler.sh                 # Bash compiler (production)
├── compiler.pseudo             # Pseudocode spec for compiler
│
├── Learn<Language>/             # One directory per language
│   ├── README.md               # Course introduction IN THE TARGET LANGUAGE
│   ├── A1/                     # CEFR Breakthrough level
│   │   ├── 00_foundation/
│   │   ├── 01_pronouns_and_verbs/
│   │   ├── 02_basic_sentences/
│   │   ├── 03_numbers_and_time/
│   │   ├── 04_family_and_adjectives/
│   │   ├── 05_food_and_places/
│   │   ├── 06_functional_dialogues/
│   │   └── 07_wrap_up/
│   ├── A2/                     # (future)
│   └── lang_specific/          # Language‑specific features
│
├── tools/                       # CLI tools
│   ├── compile                  # Compiles a Learn<Lang> folder → .md
│   └── build-pdf                # Builds a PDF from compiled .md
│
└── skills/                      # Agent skills
    └── learnlang-scaffold       # Scaffolds a new Learn<Lang> from template
```

### Must contain

- One `Learn<Language>/` directory per supported language.
- Inside each `Learn<Language>/`:
  - `README.md` — course introduction written in the target language.
  - `A1/` — the A1 Breakthrough level, subdivided into numbered sections.
  - `lang_specific/` — language‑specific structural features.
- `AGENTS.md` at the repository root contains AI behaviour instructions for scaffolding new languages.
- File names are in English regardless of the target language.
- Folder prefixes (`00_`, `01_`, …) determine curriculum order.

### MKF compliance

Every `.md` file **must** include YAML frontmatter with at least:

```yaml
---
title: <string>                       # Required — human‑readable title
language: <language_code>             # Required — e.g. de, eo, zh
cefr: <level>                         # Required — e.g. A1
section: <path_relative_to_level>     # Required — e.g. 00_foundation/alphabet
type: <vocabulary | dialogue | reference | story>  # Required
tags: [<tag1>, <tag2>]                # Optional — e.g. [numbers, ordinals]
description: <string>                 # Optional — short summary
---
```

Folders containing an `index.md` become **compound MKF nodes**. Each A1 section folder (e.g. `A1/03_numbers_and_time/`) **should** contain an `index.md` that links to its children and provides a section overview in the target language.

---

## 3. CEFR Progression

### A1 Breakthrough

The A1 level covers: *introduce yourself, handle basic everyday exchanges, understand very simple, slow speech/text.*

The progression interleaves grammar and vocabulary so the learner can make sentences from early on.

#### Foundation (mechanics)

| # | Topic | File(s) | Notes |
|---|-------|---------|-------|
| 1 | Alphabet / writing system | `00_foundation/alphabet.md` | Letter names, spelling |
| 2 | Pronunciation / phonemes | `00_foundation/pronunciation.md` | Key sounds, stress, tone rules if applicable |
| 3 | Basic greetings & courtesy | `00_foundation/greetings.md` | hello, please, thank you, sorry, goodbye |

#### Core grammar skeleton (interleaved with vocab)

| # | Topic | File(s) | Notes |
|---|-------|---------|-------|
| 4 | Personal pronouns | `01_pronouns_and_verbs/pronouns.md` | I, you, he/she, we, they |
| 5 | "To be" and "to have" | `01_pronouns_and_verbs/to_be_and_to_have.md` | Essential copula verbs |
| 6 | Basic sentence structure | `02_basic_sentences/word_order.md` | SVO / SOV / V2 as applicable |
| 7 | Present tense (regular verbs) | `02_basic_sentences/present_tense.md` | Common regular verbs |
| 8 | Articles, gender, plurals | `lang_specific/articles_gender_plurals.md` | Only if the language has them |
| 9 | Question words | `02_basic_sentences/questions.md` | who, what, where, when, why, how |
| 10 | Negation | `02_basic_sentences/negation.md` | Not, don't, never |

#### Building vocabulary

| # | Topic | File(s) | Notes |
|---|-------|---------|-------|
| 11 | Numbers (cardinal + ordinal) | `03_numbers_and_time/cardinals.md`, `03_numbers_and_time/ordinals.md` | 0–10, 11–100, 100–1000, ordinals |
| 12 | Days, months, telling time | `03_numbers_and_time/days_months.md`, `03_numbers_and_time/clock_time.md` | Calendar and clock |
| 13 | Family members | `04_family_and_adjectives/family.md` | Mother, father, sibling, etc. |
| 14 | Colours, basic adjectives | `04_family_and_adjectives/colours.md`, `04_family_and_adjectives/adjectives.md` | Common descriptors |
| 15 | Common nouns: food, objects, places | `05_food_and_places/food.md`, `05_food_and_places/objects.md`, `05_food_and_places/places.md` | Daily‑life vocabulary |

#### Putting it together

| # | Topic | File(s) | Notes |
|---|-------|---------|-------|
| 16 | Functional dialogues | `06_functional_dialogues/` | Introducing yourself, shopping, ordering food, directions, weather/hobbies small talk |

#### Wrap‑up

| # | Topic | File(s) | Notes |
|---|-------|---------|-------|
| 17 | Basic connectors | `07_wrap_up/connectors.md` | and, but, because, then |
| 18 | Short texts | `07_wrap_up/short_texts.md` | Very simple reading / listening passages |
| 19 | Producing output | `07_wrap_up/my_introduction.md` | Model sentences about yourself |

### Must contain

- Each A1 section folder maps to one numbered step in the progression above.
- The order is a **guide** — steps 4–10 (grammar) and 11–15 (vocab) are interleaved in practice so the learner can form sentences early.
- Stories **must** be included in functional dialogues (`06_functional_dialogues/`) and short texts (`07_wrap_up/short_texts.md`) — these are narratives in the target language that reinforce vocabulary in context.
- Higher CEFR levels (`A2/`, `B1/`, …) follow the same numbered‑section pattern when added.

---

## 4. Content Patterns

Three patterns are defined for `.md` body content. Every file must use exactly one.

### Pattern A — Normal vocabulary (universal volumes)

Used for most vocabulary sections. Items are comma‑separated, followed by short example phrases.

```markdown
---
title: ...
language: ...
cefr: A1
section: ...
type: vocabulary
tags: [...]
---

## Theme

item1, item2, item3, item4, item5

short phrase using item1
short phrase using item3
short phrase mixing item2 and item4
```

### Pattern B — Different script (lang_specific or adapted volumes)

Used when the target language uses a non‑Latin script with an official romanisation system. Romanised form first, native script second.

```markdown
---
title: ...
language: ...
cefr: A1
section: ...
type: vocabulary
---

## Theme

romanised1, romanised2, romanised3, romanised4

native_script1, native_script2, native_script3, native_script4
```

If the language has no widely‑used romanisation, omit the romanised line and use only the native script; the alphabet/pronunciation files then teach the script directly.

### Pattern C — Numbers (always spoken‑first)

Numbers always lead with the spoken word, followed by the numeral.

```markdown
---
title: ...
language: ...
cefr: A1
section: ...
type: vocabulary
---

## Numbers X to Y

word1, word2, word3, word4

numeral1, numeral2, numeral3, numeral4
```

### Must contain

- Every content file uses exactly one of Pattern A, B, or C.
- Pattern B is only used for languages with a non‑Latin script.
- Pattern C is always used for number sections.
- The Markdown structure (headings, comma lists, phrasing) is preserved exactly when translating — items translate one-to-one.
- Content is written for TTS playback: items are comma-separated within a sentence, example phrases are complete utterances, and lists flow naturally when spoken aloud.

---

## 5. Compiler Specification

### Input

A `Learn<Language>/` directory path.

### Processing

1. Enumerate all `.md` files recursively via `find … -print0 | sort -z`.
2. Skip `README.md`.
3. For each file:
   a. Validate that the first line is a `# ` heading.
   b. Demote `# ` → `## ` so the compiled file nests cleanly.
   c. Append the body (everything after line 1).
   d. Separate files with `\n---\n\n`.

### Output

A single `Learn<Language>.md` file containing all sections in curriculum order.

### Must contain

- `compiler.sh` implements the above in Bash (existing).
- `compiler.pseudo` is the canonical pseudocode specification (existing).
- The compiler changes exactly two things: (1) demotes `#` → `##` so the output nests cleanly, (2) inserts `---` separators between files. All other content passes through unchanged.
- The compiler **must** warn on files missing a `# ` heading and continue processing.
- The compiler **must** sort files by path so numbered prefixes determine order.

---

## 6. PDF Builder Specification

### Input

A compiled `Learn<Language>.md` file.

### Processing

1. Parse frontmatter from each section to extract the `language` field.
2. Generate one PDF page per section (or per logical break).
3. Each PDF page **must**:
   a. Contain content from exactly one language.
   b. Declare the language in PDF metadata (title, subject, custom tags) so TTS tools can select the correct voice without guessing.
4. If the compiled `.md` contains mixed‑language content (e.g. a bilingual glossary), split into separate pages per language.

### Output

A `Learn<Language>.pdf` file with per‑page language metadata.

### Must contain

- Each page has an explicit language tag in PDF metadata.
- Each page contains content from exactly one language.
- The tool supports custom metadata fields for language declaration (e.g. PDF `/Lang` entry, XMP metadata).
- Fallback: if a section has no frontmatter `language` field, the tool **must** exit with an error listing the missing fields.

---

## 7. Agent Skill: `learnlang-scaffold`

### Purpose

Scaffold a new `Learn<Language>/` directory from a canonical English template. The skill:

1. Reads a `LearnEnglish/` template (the canonical source).
2. Translates each universal volume (Pattern A, B, C) item‑by‑item into the target language.
3. Adapts the curriculum for language‑specific features:
   - **Tonal languages** (Mandarin, Vietnamese, Thai) → add `lang_specific/tones.md`.
   - **Multiple writing systems** (Japanese) → add Pattern B support and a progression that teaches writing systems gradually.
   - **Politeness levels** (Japanese, Korean) → add `lang_specific/honorifics.md`.
   - **Noun classes** (Swahili, Bantu) → add `lang_specific/noun_classes.md`.
   - **Complex scripts** → expand `00_foundation/` with additional files.
4. Writes `lang_specific/` from scratch, adapting to the target language's structural features.
5. Generates valid MKF frontmatter on every file.
6. Writes `README.md` in the target language.

### Must contain

- Invocable as a pi agent skill.
- Takes a target language name and ISO code as parameters.
- Validates that the target language does not already exist in the repository.
- Produces a complete `Learn<Language>/A1/` hierarchy with all 19 progression steps.
- Produces `README.md` entirely in the target language.


---

## 8. CLI Tools

### `compile`

- Existing: `compiler.sh Learn<Language>/`.
- Future: rewrite as a proper CLI (Python, Node, or Rust) with argument parsing, error messages, and exit codes.
- Should accept `--output` flag for custom output path.
- Should accept `--cefr` flag to compile only a specific level (e.g. `--cefr A1`).

### `build-pdf`

- New CLI tool.
- Input: compiled `.md` (or raw `Learn<Language>/` folder).
- Output: `.pdf` with per‑page language metadata.
- Must respect the PDF rules in §6.
- Should support `--language` override for metadata.

### Must contain

- Both tools live in `tools/`.
- Both tools have `--help` output.
- Both tools exit with code 0 on success, non‑zero on error.
- `build-pdf` validates that every input section has frontmatter with a `language` field before processing.

---

## 9. Migration Path

### From current state to v1

| Step | Change | Impact |
|------|--------|--------|
| 1 | Create `./AGENTS.md` at repo root with AI scaffolding instructions | Single source of truth for agent behaviour |
| 2 | Add MKF‑compliant YAML frontmatter to every `.md` file | All existing files need frontmatter added |
| 3 | Rewrite `LearnGerman/README.md` and `LearnEsperanto/README.md` in the target language | `README.md` becomes a proper course introduction |
| 4 | Restructure `Learn<Lang>/` to use `A1/` subfolder and the 19‑step progression | Old flat 00‑07 structure moves under `A1/` with the new topic mapping |
| 5 | Add `index.md` files to section folders for MKF compound‑node compliance | Each A1 section folder gets an overview |
| 6 | Create `tools/compile` as a proper CLI | `compiler.sh` remains but the new CLI is the recommended path |
| 7 | Create `tools/build-pdf` | New tool |
| 8 | Create `skills/learnlang-scaffold` | New agent skill |
| 9 | Update `README.md` at project root | Document the new structure |

---

## 10. Stakeholders

| Role | Interest | Influence | Key concerns |
|------|----------|-----------|--------------|
| Language learner | Wants passive, TTS‑first exposure — no exercises | High — the entire project is for them | Content must be TTS‑readable; no wrong‑voice issues; progression must feel natural |
| Content creator / AI agent | Wants a clear template to scaffold new languages | High — determines how fast the project scales | Template must be unambiguous; translation rules must be explicit; file names must be navigable |
| Repository maintainer | Wants a clean, spec‑driven, MKF‑compliant repo | High — enforces structure and conventions | No duplicated instructions; clear boundaries; one‑concern‑per‑file discipline |

---

## 11. Design Decisions

### ADR‑worthy decisions (to be formalised in `adr/`)

| Decision                                                      | Rationale                                                                                                             |
| ------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| Single `AGENTS.md` at repo root for AI behaviour instructions | Eliminates duplication; single source of truth for agent instructions                                                 |
| MKF compliance                                                | Makes the repository machine‑readable and agent‑navigable without parsing conventions ad hoc                          |
| Per‑page language metadata in PDF                             | TTS tools need explicit language to select the correct voice; guessing leads to wrong‑accent or wrong‑language output |
| `README.md` in target language                                | The course starts the moment you open the folder — no English crutch                                                  |
| Story passages in dialogue sections                           | Narrative context aids comprehension and retention better than isolated word lists                                    |
| Interleaved grammar + vocab (vs block order)                  | Learners can form sentences earlier, which is the actual A1 goal                                                      |
|                                                               |                                                                                                                       |
