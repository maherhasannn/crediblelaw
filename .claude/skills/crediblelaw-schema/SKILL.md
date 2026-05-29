---
name: crediblelaw-schema
description: Generate a complete enterprise-level JSON-LD schema @graph for Credible Law pages (bankruptcy, business debt, MCA defense, asset protection, Chapter 11, Subchapter V, UCC liens, bank levies, judgment defense, creditor lawsuits, commercial litigation). The user provides a page slug plus the full page content; the skill outputs only the final JSON-LD script tag — Google-indexable, ready to paste into WordPress. Use whenever the user pastes Credible Law page content and asks for schema, JSON-LD, structured data, or anything along those lines.
---

# Credible Law Schema Generator

This skill produces one thing: a complete, valid, Google-indexable `<script type="application/ld+json">` block for a Credible Law page. Nothing else. No preamble, no "here you go", no closing notes. Just the script tag.

## Input contract

The user will always provide:
1. A slug or full URL (e.g., `mca-bankruptcy-options` or `https://crediblelaw.com/mca-bankruptcy-options/`)
2. The full page content (HTML or pasted text — title, meta description, H1, body copy, FAQ section, internal links)

If either is missing, ask once. Do not fetch the page. Do not invent content.

## Output contract

Return only:

```
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@graph": [ ... ]
}
</script>
```

No text before. No text after. No code-fence labels like ```json. Just the script tag and its valid JSON-LD contents.

## Build process

Work through these steps in order. Don't skip steps to save time — every entity below is required.

### Step 1: Extract page facts from the content

From the pasted page content, pull:
- **Full page URL**: `https://crediblelaw.com/<slug>/` (always trailing slash)
- **SEO title**: from the `<title>` tag or page title
- **Meta description**: from the meta description tag
- **H1**: the main article headline
- **Word count**: count words in the article body (exclude nav, footer, FAQ if it's structurally separate from the article — but include FAQ text if it's part of the article flow). This is good for SEO; include it.
- **Primary keyword**: the main topic phrase from the H1/title (e.g., "Chapter 11 bankruptcy", "MCA defense", "business bank levy")
- **Secondary keyword**: a closely related phrase from the H1, subheads, or repeated body language
- **FAQs**: pull every Q&A pair from the FAQ section verbatim. Do not paraphrase. Do not invent FAQs. If there is no FAQ section on the page, STOP and tell the user — do not generate a fake one.
- **Internal/external links**: collect every URL referenced in the page content. You'll verify and use these later.

### Step 2: Classify the page topic

Read the content and assign the page to one of these buckets. The classification drives the breadcrumb parent, the Service entity, and which DefinedTerms/Things to include.

- **Bankruptcy** — Chapter 11, Chapter 7, Subchapter V, business bankruptcy, reorganization, emergency filing, debtor-in-possession
  - Breadcrumb parent: `Bankruptcy and Debt Solutions` → `https://crediblelaw.com/bankruptcy-and-debt-solutions/`
- **MCA Defense** — merchant cash advance, MCA lawsuit, MCA collections, MCA settlement, MCA bank levy, stop ACH withdrawals, confession of judgment, MCA default judgment, MCA UCC lien
  - Breadcrumb parent: `Merchant Cash Advance Defense` → `https://crediblelaw.com/mca-defense-attorney/`
- **Creditor / Commercial Litigation** — creditor lawsuit, judgment defense, breach of contract, partnership disputes, shareholder disputes, commercial fraud, business litigation
  - Breadcrumb parent: `Business Litigation` → `https://crediblelaw.com/business-litigation/`
- **Asset Protection / Bank Levy / UCC Lien** — business bank levy, frozen account, UCC lien removal, asset protection, receivables lien
  - Breadcrumb parent: pick the closest fit. UCC and bank levy pages tied to MCA → MCA Defense. UCC and bank levy pages tied to general creditors → Business Litigation. Pure asset protection content → `Bankruptcy and Debt Solutions`.

If the page is genuinely mixed, pick the bucket that best matches the H1's primary intent.

### Step 3: Verify every link before using it

The page content you were given contains internal Credible Law links and possibly external links. **Verify every link is one that exists on Credible Law or is a known authoritative external source before including it in the schema.**

The full list of confirmed-valid links lives in `references/valid-links.md`. Read that file and use only links from it (or links present in the user's pasted page content that match patterns there). If a link in the page content isn't on the valid list and you can't confirm it, leave it out. Never link to a page that may not exist.

For DefinedTerm `url` fields: only attach a URL if the term maps cleanly to a confirmed page (e.g., "Merchant cash advance" → `https://crediblelaw.com/mca-defense-attorney/`). When in doubt, omit the URL field rather than guess.

For external `sameAs` on Thing entities: use only the authoritative sources listed in `references/valid-links.md`.

### Step 4: Assemble the @graph

The full schema spec — every required entity, every stable @id, exact JSON shapes, breadcrumb structure, Service-entity variants by page topic, DefinedTerm list, and Thing list — lives in `references/schema-spec.md`. Read that file and follow it exactly. It is the source of truth.

Key rules that apply across every page:

- **NAP must be exact every time**: Credible Law / 160 Thorn St, San Diego, CA 92103 / +1-888-201-0441
- **Stable @id values**: site-wide entities use the IDs documented in the spec; page-specific entities use `[full page URL]#<entity>` form
- **Dates**: always use today's date for both `datePublished` and `dateModified` in YYYY-MM-DD format. Today is May 29, 2026 → `2026-05-29`. Update this each time you generate.
- **FAQ entities**: one `Question` per Q&A pulled from the page, with the answer verbatim from the page
- **Word count**: include it as a string in the Article entity
- **Keywords array**: lead with primary keyword, then secondary keyword, then the standard topical keywords listed in the spec
- **DefinedTerms and Things**: include only the entities relevant to the page's topic bucket. The spec lists which ones apply to which bucket.

### Step 5: Compliance check before returning

Before outputting, mentally verify:

- [ ] All URLs are absolute (start with `https://`)
- [ ] All `@id` values are stable and follow the documented pattern
- [ ] No fake reviews, no `aggregateRating`, no fake attorney names
- [ ] No "best", "top rated", "guaranteed", or outcome promises
- [ ] No language that suggests viewing the page creates an attorney-client relationship
- [ ] Every link points to a confirmed-real page (Credible Law internal or authoritative external)
- [ ] FAQ answers are legally cautious — they describe how things may work, not guarantees
- [ ] JSON is valid (no trailing commas, all strings quoted, all brackets matched)
- [ ] Output is ONLY the `<script>` block — no preamble or commentary

### Step 6: Return the script block

Output the `<script type="application/ld+json">` block with the assembled `@graph`. Nothing else.

## What this skill never does

- Never fetches pages from the web. The user always provides full content.
- Never invents FAQs. If the page lacks an FAQ section, stop and ask the user.
- Never links to a page that hasn't been verified against the valid-links reference.
- Never adds preamble, explanations, or closing remarks to the output.
- Never includes `aggregateRating`, fake reviews, fake attorney names, or guaranteed-outcome language.
- Never uses superlatives like "best" or "top rated" that imply unsupported superiority.
