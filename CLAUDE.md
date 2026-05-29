# Credible Law — Claude Code Instructions

## Project overview

This repo powers content operations for [crediblelaw.com](https://crediblelaw.com) — a legal referral network specializing in business bankruptcy, MCA defense, UCC liens, bank levies, asset protection, and commercial litigation. The site runs on WordPress.

All content targets distressed business owners searching for legal help. Every article must be written for conversion, not just traffic.

---

## Environment

WordPress credentials are loaded automatically from `.env` at session start via the SessionStart hook. They are available as environment variables:

- `WP_USERNAME` — WordPress admin username
- `WP_APP_PASSWORD` — WordPress application password
- `WP_API_ENDPOINT` — `https://crediblelaw.com/wp-json/wp/v2/posts`

If credentials are missing, run the session-start hook manually:
```bash
CLAUDE_CODE_REMOTE=true CLAUDE_PROJECT_DIR=$(pwd) CLAUDE_ENV_FILE=/tmp/claude-env bash .claude/hooks/session-start.sh
```

---

## Available skills

Three custom skills are installed automatically at session start:

| Skill | Purpose |
|---|---|
| `/crediblelaw-url` | Canonical URL map — 60 slugs across 6 tiers. Always pull slugs from here. |
| `/bk-wp` | Full article engine — 4,000–8,000 words, 3 CTAs, 15–25 FAQs, tables, checklists |
| `/crediblelaw-schema` | Generates the JSON-LD `<script>` block. Requires the article content as input. |

---

## Full content + posting routine

Follow these steps in order every time a new draft is created.

### Step 1 — Pick a slug with `/crediblelaw-url`

Invoke `/crediblelaw-url` to review the canonical page map. Either:
- Pick an existing slug that hasn't been built yet, or
- Identify the right tier and mint a new slug following that tier's naming convention

The slug drives the page URL and all internal linking. Never invent a slug without checking here first.

### Step 2 — Write the article with `/bk-wp`

Invoke `/bk-wp` with the chosen slug/topic. The skill will produce:

- 4,000–8,000 word article in WordPress Gutenberg block HTML
- 3 contextually rewritten CTA HTML blocks (dark hero, light red mid, white card)
- 15–25 FAQ entries formatted for AI Overview extraction
- At least one comparison table and one operational checklist
- Internal links using only confirmed slugs from `/crediblelaw-url`
- External links to authoritative sources only: `.gov`, `.edu`, `.org`
- Full deliverables block at the end (SEO title, meta description, slug, H1, internal link map, etc.)

**Before moving to Step 3:** Verify every link in the article — internal and external — returns a valid response. Do not skip this check.

### Step 3 — Generate schema with `/crediblelaw-schema`

Invoke `/crediblelaw-schema` and pass:
1. The full page URL (`https://crediblelaw.com/<slug>/`)
2. The complete article content from Step 2

The skill outputs a single `<script type="application/ld+json">` block — ready to paste into WordPress as a Custom HTML block at the bottom of the post content.

The schema includes: `Organization`, `ContactPoint`, `Place`, `LegalService`, `LocalBusiness`, `WebSite`, `WebPage`, `Article`, `FAQPage`, `Service`, `BreadcrumbList`, `DefinedTermSet`, and relevant `DefinedTerm` / `Thing` entities for the page's topic bucket.

**The schema skill will refuse to generate if:**
- No FAQ section exists in the article
- Any link hasn't been verified against `references/valid-links.md`

### Step 4 — Final link check

Before posting, confirm:
- [ ] All internal links resolve to real crediblelaw.com pages (use the valid-links list in `.claude/skills/crediblelaw-schema/references/valid-links.md`)
- [ ] All external links return HTTP 200
- [ ] No bracketed placeholder text survives in the CTAs (`[CONTEXT-SPECIFIC HEADLINE]`, etc.)
- [ ] Schema JSON is valid (no trailing commas, all brackets matched)

### Step 5 — Post to WordPress

Post the draft using the WordPress REST API:

```bash
python3 post_draft.py
```

The script reads credentials from `.env`, posts to `https://crediblelaw.com/wp-json/wp/v2/posts` with `status: draft`, and prints the post ID and preview URL on success.

**The content field must include:**
1. The full Gutenberg block HTML from Step 2
2. The `<script type="application/ld+json">` block from Step 3 appended as a `<!-- wp:html -->` block at the bottom

**On success:** Log the post ID. The draft is live in WordPress and ready for review before publishing.

---

## Content standards

- Voice: senior restructuring attorney speaking to a panicked business owner — specific, calm, never sensational
- Every section opens with a 2–3 sentence direct answer (AI Overview ready)
- No unsupported guarantees, no "best" or "top rated", no outcome promises
- Legal framing: "may," "depending on jurisdiction," "in many cases" — never "will" or "guaranteed"
- Word count: 4,000–8,000 words per article
- CTAs: 3 per article, all contextually rewritten — no generic copy, no surviving placeholders

## NAP (never change)

- **Name:** Credible Law
- **Address:** 160 Thorn St, San Diego, CA 92103
- **Phone:** (888) 201-0441 / `+1-888-201-0441`
- **Contact URL:** `https://crediblelaw.com/contact/`
- **API endpoint:** `https://crediblelaw.com/wp-json/wp/v2/posts`
