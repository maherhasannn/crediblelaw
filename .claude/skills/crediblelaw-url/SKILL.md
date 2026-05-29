---
name: crediblelaw-url
description: "The canonical URL architecture and page map for the Credible Law site (business bankruptcy, Chapter 11, Subchapter V, MCA-to-bankruptcy, business distress/survival, procedural authority, and industry-specific restructuring pages). Use whenever the user needs a slug/URL for a Credible Law page, asks where a topic should live on the site, wants internal-linking guidance, asks what page to build next, or needs to confirm a page already exists. Returns exact slugs, tier/cluster placement, and the interlink logic between tiers. Pair with bk-wp (article body) and crediblelaw-schema (JSON-LD)."
---

# Credible Law — URL Architecture & Page Map

Single source of truth for Credible Law page slugs and where any topic belongs. When generating an article (bk-wp) or schema (crediblelaw-schema), pull the canonical slug from here so URLs stay consistent across the site.

## How to use this

- **Need a URL for a page?** Find the topic below, use the exact slug. Don't invent new slugs if one already exists.
- **Topic not listed?** Slot it into the closest tier, mint a slug in that tier's style (lowercase, hyphenated, `-san-diego` suffix only for geo-commercial pages), and tell the user it's a new addition.
- **Internal linking?** Use the tier interlink logic at the bottom.
- All slugs are root-relative and end with a trailing slash.

## Tier structure at a glance

| Tier | Purpose | Geo-suffix? |
|---|---|---|
| 1 — Core Commercial | Highest revenue + intent; money pages | Yes (`-san-diego`) |
| 2 — MCA → Bankruptcy Bridge | Convert existing MCA rankings into retention | No |
| 3 — Subchapter V Authority | Semantic depth cluster on Sub V | No |
| 4 — Business Distress / Survival | Upstream "my business is failing" intent | No |
| 5 — Procedural / Authority | Trust/E-E-A-T, how-it-works, court guides | No |
| 6 — Industry-Specific Restructuring | High-conversion vertical pages | Mixed |

---

## TIER 1 — Core Commercial Pages
Highest revenue + highest intent. Money pages.

| Title | URL |
|---|---|
| San Diego Chapter 11 Bankruptcy Lawyer | /san-diego-chapter-11-bankruptcy-lawyer/ |
| Subchapter V Bankruptcy San Diego | /subchapter-v-bankruptcy-san-diego/ |
| Emergency Chapter 11 Filing San Diego | /emergency-chapter-11-filing-san-diego/ |
| Business Bankruptcy Lawyer San Diego | /business-bankruptcy-lawyer-san-diego/ |
| Small Business Bankruptcy San Diego | /small-business-bankruptcy-san-diego/ |
| San Diego Business Debt Restructuring Lawyer | /business-debt-restructuring-san-diego/ |
| San Diego Business Reorganization Attorney | /business-reorganization-attorney-san-diego/ |
| Chapter 11 Lawyer for Restaurants San Diego | /restaurant-chapter-11-lawyer-san-diego/ |
| Chapter 11 Lawyer for Trucking Companies San Diego | /trucking-chapter-11-lawyer-san-diego/ |
| Commercial Bankruptcy Lawyer San Diego | /commercial-bankruptcy-lawyer-san-diego/ |

## TIER 2 — MCA → Bankruptcy Bridge Pages
The goldmine. Connect existing MCA rankings into bankruptcy retention.

| Title | URL |
|---|---|
| Can Chapter 11 Stop MCA Withdrawals? | /chapter-11-stop-mca-withdrawals/ |
| Can Bankruptcy Stop an MCA Lawsuit? | /bankruptcy-stop-mca-lawsuit/ |
| Subchapter V for MCA Debt Problems | /subchapter-v-mca-debt/ |
| Using Bankruptcy to Stop MCA Collections | /bankruptcy-stop-mca-collections/ |
| Can Chapter 11 Remove UCC Liens? | /chapter-11-remove-ucc-liens/ |
| Emergency Bankruptcy for MCA Bank Levies | /bankruptcy-stop-mca-bank-levy/ |
| Can Bankruptcy Stop Frozen Business Accounts? | /bankruptcy-stop-bank-account-freeze/ |
| MCA Debt Restructuring Through Chapter 11 | /mca-debt-restructuring-bankruptcy/ |
| What Happens to MCA Debt in Chapter 11? | /mca-debt-chapter-11/ |
| Merchant Cash Advance Bankruptcy Options | /merchant-cash-advance-bankruptcy-options/ |

## TIER 3 — Subchapter V Authority Cluster
Massive semantic opportunity.

| Title | URL |
|---|---|
| What Is Subchapter V Bankruptcy? | /what-is-subchapter-v-bankruptcy/ |
| Who Qualifies for Subchapter V? | /subchapter-v-qualification-guide/ |
| Subchapter V vs Traditional Chapter 11 | /subchapter-v-vs-chapter-11/ |
| How Long Does Subchapter V Take? | /subchapter-v-bankruptcy-timeline/ |
| Subchapter V Bankruptcy Costs | /subchapter-v-bankruptcy-costs/ |
| How the Subchapter V Trustee Works | /subchapter-v-trustee-explained/ |
| Can an LLC File Subchapter V? | /llc-subchapter-v-bankruptcy/ |
| Can Restaurants Use Subchapter V? | /restaurant-subchapter-v-bankruptcy/ |
| Can Trucking Companies Use Subchapter V? | /trucking-subchapter-v-bankruptcy/ |
| Can Ecommerce Businesses Use Subchapter V? | /ecommerce-subchapter-v-bankruptcy/ |

## TIER 4 — Business Distress / Survival Pages
Capture huge upstream intent.

| Title | URL |
|---|---|
| How to Save a Failing Business | /how-to-save-a-failing-business/ |
| Business Cannot Make Payroll — What Now? | /business-cannot-make-payroll/ |
| What Happens if a Business Closes With Debt? | /business-closes-with-debt/ |
| How to Restructure Business Debt | /how-to-restructure-business-debt/ |
| Emergency Business Debt Relief Options | /emergency-business-debt-relief/ |
| Can Bankruptcy Stop Commercial Eviction? | /stop-commercial-eviction-bankruptcy/ |
| What Happens to Business Leases in Chapter 11? | /business-leases-chapter-11/ |
| Business Debt Workout vs Bankruptcy | /business-debt-workout-vs-bankruptcy/ |
| Signs Your Business Needs Chapter 11 | /signs-business-needs-chapter-11/ |
| Last-Minute Business Bankruptcy Options | /last-minute-business-bankruptcy-options/ |

## TIER 5 — Procedural / High-Trust Authority Pages
Help Google trust the ecosystem.

| Title | URL |
|---|---|
| Chapter 11 vs Chapter 7 for Businesses | /chapter-11-vs-chapter-7-business/ |
| How Chapter 11 Bankruptcy Works | /how-chapter-11-bankruptcy-works/ |
| Chapter 11 Bankruptcy Timeline | /chapter-11-bankruptcy-timeline/ |
| Debtor in Possession Explained | /debtor-in-possession-explained/ |
| Automatic Stay Explained for Businesses | /automatic-stay-business-bankruptcy/ |
| What Happens After Filing Chapter 11? | /after-filing-chapter-11/ |
| Southern District of California Bankruptcy Court Guide | /southern-district-california-bankruptcy-court/ |
| Chapter 11 Bankruptcy Cost Calculator | /chapter-11-bankruptcy-cost-calculator/ |
| Business Bankruptcy FAQ | /business-bankruptcy-faq/ |
| Small Business Reorganization Act Guide | /small-business-reorganization-act-guide/ |

## TIER 6 — Industry-Specific Restructuring Pages
Extremely high conversion potential.

| Title | URL |
|---|---|
| Restaurant Bankruptcy Lawyer San Diego | /restaurant-bankruptcy-lawyer-san-diego/ |
| Hospitality Business Bankruptcy San Diego | /hospitality-business-bankruptcy-san-diego/ |
| Retail Business Bankruptcy Lawyer | /retail-business-bankruptcy-lawyer/ |
| Construction Company Bankruptcy Lawyer | /construction-company-bankruptcy-lawyer/ |
| Trucking Company Bankruptcy Lawyer | /trucking-company-bankruptcy-lawyer/ |
| Medical Practice Bankruptcy Lawyer | /medical-practice-bankruptcy-lawyer/ |
| Ecommerce Business Bankruptcy Lawyer | /ecommerce-bankruptcy-lawyer/ |
| Franchise Bankruptcy Lawyer | /franchise-bankruptcy-lawyer/ |
| Startup Bankruptcy Lawyer | /startup-bankruptcy-lawyer/ |
| Manufacturing Business Bankruptcy Lawyer | /manufacturing-business-bankruptcy-lawyer/ |

---

## Internal linking logic

The site is a funnel, not a flat list. Link downward for intent capture and upward for conversion.

- **Tier 4 (distress) → Tier 2 (MCA bridge) → Tier 1 (money pages).** A panicked "can't make payroll" reader should be routed toward the relevant bridge page, then the geo money page.
- **Tier 3 (Sub V cluster)** interlinks tightly within itself and points up to Tier 1 Sub V money pages (`/subchapter-v-bankruptcy-san-diego/`). The "What Is" pillar links to every other Tier 3 page; each Tier 3 page links back to the pillar.
- **Tier 2 bridge pages** are the conversion engine — each should link to the closest Tier 1 money page and to the relevant Tier 3 explainer (e.g. `/subchapter-v-mca-debt/` → `/what-is-subchapter-v-bankruptcy/`).
- **Tier 5 (procedural)** are reference hubs — link them from everywhere; they link up to Tier 1 but rarely receive a hard CTA.
- **Tier 6 (industry)** pages link to their Tier 1 geo cousin where one exists (e.g. `/restaurant-bankruptcy-lawyer-san-diego/` ↔ `/restaurant-chapter-11-lawyer-san-diego/`) and to the matching Tier 3 industry-Sub-V page.

## Slug conventions

- Lowercase, hyphen-separated, trailing slash.
- `-san-diego` suffix only on geo-commercial pages (Tiers 1, parts of 6). Informational/authority pages (Tiers 2–5) carry no geo suffix.
- Keep the primary keyword at the front of the slug.
- Don't duplicate an existing slug for a near-identical topic — reuse the canonical one above.
