# Credible Law Schema Spec

The complete entity inventory and JSON shapes for every Credible Law page. Follow this exactly when assembling the `@graph`.

## Table of contents

1. NAP and stable IDs
2. Site-wide entities (same on every page)
3. Page-specific entities (vary by page)
4. Service entity variants by page topic
5. Breadcrumb variants by page topic
6. DefinedTerm full list with descriptions
7. Thing entity full list
8. Topic-bucket → entity-inclusion map

---

## 1. NAP and stable IDs

**Name / Address / Phone — exact on every page:**
- Credible Law
- 160 Thorn St, San Diego, CA 92103
- +1-888-201-0441

**Site-wide stable @id values:**
- `https://crediblelaw.com/#organization`
- `https://crediblelaw.com/#legalservice`
- `https://crediblelaw.com/#localbusiness`
- `https://crediblelaw.com/#website`
- `https://crediblelaw.com/#place`
- `https://crediblelaw.com/#contact`

**Page-specific stable @id pattern** (where `[URL]` = full page URL):
- `[URL]#webpage`
- `[URL]#article`
- `[URL]#faq`
- `[URL]#service`
- `[URL]#breadcrumb`
- `[URL]#terms`
- `[URL]#primary-topic`
- `[URL]#<term-slug>` for each DefinedTerm and Thing (e.g., `#chapter-11-bankruptcy`, `#automatic-stay`)

---

## 2. Site-wide entities

Include all six on every page, unchanged.

### Organization

```json
{
  "@type": "Organization",
  "@id": "https://crediblelaw.com/#organization",
  "name": "Credible Law",
  "url": "https://crediblelaw.com/",
  "telephone": "+1-888-201-0441",
  "logo": {
    "@type": "ImageObject",
    "url": "https://crediblelaw.com/wp-content/uploads/credible-law-logo.png"
  },
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "160 Thorn St",
    "addressLocality": "San Diego",
    "addressRegion": "CA",
    "postalCode": "92103",
    "addressCountry": "US"
  },
  "contactPoint": { "@id": "https://crediblelaw.com/#contact" },
  "sameAs": [
    "https://www.youtube.com/@GetCredibleLaw",
    "https://www.instagram.com/crediblelaw",
    "https://www.linkedin.com/company/credible-law",
    "https://www.facebook.com/profile.php?id=61575616241309",
    "https://medium.com/@crediblelawsite"
  ]
}
```

### ContactPoint

```json
{
  "@type": "ContactPoint",
  "@id": "https://crediblelaw.com/#contact",
  "telephone": "+1-888-201-0441",
  "contactType": "customer service",
  "areaServed": "US",
  "availableLanguage": "English"
}
```

### Place

```json
{
  "@type": "Place",
  "@id": "https://crediblelaw.com/#place",
  "name": "Credible Law San Diego Office",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "160 Thorn St",
    "addressLocality": "San Diego",
    "addressRegion": "CA",
    "postalCode": "92103",
    "addressCountry": "US"
  }
}
```

### LegalService

```json
{
  "@type": "LegalService",
  "@id": "https://crediblelaw.com/#legalservice",
  "name": "Credible Law Bankruptcy, Business Debt, MCA Defense, and Asset Protection Legal Help",
  "url": "https://crediblelaw.com/",
  "telephone": "+1-888-201-0441",
  "priceRange": "Consultation-based",
  "provider": { "@id": "https://crediblelaw.com/#organization" },
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "160 Thorn St",
    "addressLocality": "San Diego",
    "addressRegion": "CA",
    "postalCode": "92103",
    "addressCountry": "US"
  },
  "areaServed": [
    { "@type": "City", "name": "San Diego" },
    { "@type": "State", "name": "California" },
    { "@type": "Country", "name": "United States" }
  ],
  "serviceType": [
    "Business bankruptcy",
    "Chapter 11 bankruptcy",
    "Subchapter V bankruptcy",
    "Business debt restructuring",
    "Business asset protection",
    "Creditor lawsuit defense",
    "Judgment defense",
    "Default judgment defense",
    "Business bank levy defense",
    "Frozen business bank account legal help",
    "UCC lien defense",
    "UCC lien removal",
    "Merchant cash advance defense",
    "MCA lawsuit defense",
    "MCA bankruptcy options",
    "Commercial litigation defense",
    "Emergency business debt legal help"
  ],
  "knowsAbout": [
    "Chapter 11 bankruptcy",
    "Subchapter V bankruptcy",
    "Chapter 7 bankruptcy",
    "Automatic stay",
    "Business debt restructuring",
    "Business asset protection",
    "Judgment enforcement",
    "Bank levies",
    "Frozen business bank accounts",
    "UCC liens",
    "UCC-1 financing statements",
    "Merchant cash advances",
    "MCA lawsuits",
    "MCA collections",
    "Default judgments",
    "Confession of judgment",
    "Accounts receivable liens",
    "Business litigation",
    "Commercial litigation",
    "Business debt settlement",
    "Asset liquidation",
    "Reorganization plans",
    "Debtor-in-possession operations"
  ]
}
```

### LocalBusiness

```json
{
  "@type": "LocalBusiness",
  "@id": "https://crediblelaw.com/#localbusiness",
  "name": "Credible Law",
  "url": "https://crediblelaw.com/",
  "telephone": "+1-888-201-0441",
  "priceRange": "Consultation-based",
  "image": "https://crediblelaw.com/wp-content/uploads/credible-law-logo.png",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "160 Thorn St",
    "addressLocality": "San Diego",
    "addressRegion": "CA",
    "postalCode": "92103",
    "addressCountry": "US"
  },
  "parentOrganization": { "@id": "https://crediblelaw.com/#organization" },
  "areaServed": ["San Diego", "California", "United States"]
}
```

### WebSite

```json
{
  "@type": "WebSite",
  "@id": "https://crediblelaw.com/#website",
  "name": "Credible Law",
  "url": "https://crediblelaw.com/",
  "publisher": { "@id": "https://crediblelaw.com/#organization" },
  "potentialAction": {
    "@type": "SearchAction",
    "target": "https://crediblelaw.com/?s={search_term_string}",
    "query-input": "required name=search_term_string"
  }
}
```

---

## 3. Page-specific entities

### WebPage

```json
{
  "@type": "WebPage",
  "@id": "[URL]#webpage",
  "url": "[URL]",
  "name": "[SEO TITLE]",
  "description": "[META DESCRIPTION]",
  "isPartOf": { "@id": "https://crediblelaw.com/#website" },
  "publisher": { "@id": "https://crediblelaw.com/#organization" },
  "provider": { "@id": "https://crediblelaw.com/#legalservice" },
  "breadcrumb": { "@id": "[URL]#breadcrumb" },
  "mainEntity": [
    { "@id": "[URL]#article" },
    { "@id": "[URL]#faq" },
    { "@id": "[URL]#service" }
  ],
  "about": [ { "@id": "[URL]#primary-topic" } ],
  "mentions": [ /* refs to relevant Thing @ids from the bucket map below */ ],
  "significantLink": [ /* verified internal links relevant to this page */ ],
  "inLanguage": "en-US"
}
```

### Article

```json
{
  "@type": "Article",
  "@id": "[URL]#article",
  "headline": "[H1]",
  "description": "[META DESCRIPTION]",
  "author": { "@id": "https://crediblelaw.com/#organization" },
  "publisher": { "@id": "https://crediblelaw.com/#organization" },
  "mainEntityOfPage": { "@id": "[URL]#webpage" },
  "datePublished": "[TODAY YYYY-MM-DD]",
  "dateModified": "[TODAY YYYY-MM-DD]",
  "articleSection": [
    "Bankruptcy Law",
    "Business Bankruptcy",
    "Business Debt",
    "Business Asset Protection",
    "Commercial Litigation",
    "Merchant Cash Advance Defense",
    "Creditor Defense"
  ],
  "keywords": [
    "[PRIMARY KEYWORD]",
    "[SECONDARY KEYWORD]",
    "business bankruptcy",
    "Chapter 11 bankruptcy",
    "Subchapter V bankruptcy",
    "business asset protection",
    "merchant cash advance defense",
    "business debt restructuring",
    "creditor lawsuit defense",
    "UCC lien defense",
    "business bank levy defense"
  ],
  "about": [ { "@id": "[URL]#primary-topic" } ],
  "mentions": [ /* same Thing refs as WebPage mentions */ ],
  "wordCount": "[INTEGER AS STRING]",
  "inLanguage": "en-US"
}
```

### FAQPage

One `Question` per Q&A pulled verbatim from the page. If no FAQ section exists, stop and tell the user — don't generate.

```json
{
  "@type": "FAQPage",
  "@id": "[URL]#faq",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "[QUESTION VERBATIM]",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "[ANSWER VERBATIM]"
      }
    }
    /* repeat for each Q&A */
  ]
}
```

### DefinedTermSet

```json
{
  "@type": "DefinedTermSet",
  "@id": "[URL]#terms",
  "name": "Bankruptcy, Business Debt, MCA Defense, and Asset Protection Legal Terms",
  "hasDefinedTerm": [ /* refs to DefinedTerm @ids relevant to this page */ ]
}
```

---

## 4. Service entity variants

Pick the variant matching the page bucket. Customize `name` and `serviceType[0]` for the specific page subject if needed.

### Bankruptcy bucket

```json
{
  "@type": "Service",
  "@id": "[URL]#service",
  "name": "[e.g., 'Chapter 11 Business Bankruptcy and Restructuring Help' or 'Subchapter V Bankruptcy Help for Small Businesses']",
  "serviceType": [
    "[Primary service for this page]",
    "Business debt legal help",
    "Commercial litigation strategy",
    "Creditor defense",
    "Asset protection risk review"
  ],
  "provider": { "@id": "https://crediblelaw.com/#legalservice" },
  "areaServed": [
    { "@type": "City", "name": "San Diego" },
    { "@type": "State", "name": "California" },
    { "@type": "Country", "name": "United States" }
  ],
  "audience": {
    "@type": "BusinessAudience",
    "audienceType": "Business owners, executives, entrepreneurs, and companies facing business debt, creditor lawsuits, MCA collections, bankruptcy risk, or asset protection concerns"
  },
  "offers": {
    "@type": "Offer",
    "name": "[Page-specific offer name, e.g., 'Chapter 11 Bankruptcy Consultation']",
    "price": "0",
    "priceCurrency": "USD",
    "description": "Consultation-oriented legal review for business owners seeking information about bankruptcy, creditor defense, business debt, MCA-related legal issues, or asset protection options. No outcome is guaranteed."
  },
  "termsOfService": "https://crediblelaw.com/terms-and-conditions/",
  "serviceOutput": [
    "bankruptcy options review",
    "business debt restructuring assessment",
    "creditor lawsuit defense evaluation",
    "asset protection risk review",
    "automatic stay strategy review",
    "judgment enforcement risk assessment",
    "bank levy response strategy",
    "UCC lien review",
    "MCA debt and lawsuit defense options",
    "business survival legal strategy"
  ]
}
```

### MCA Defense bucket

Same shape. Suggested names:
- "Merchant Cash Advance Bankruptcy and Business Debt Defense Help"
- "MCA Lawsuit Defense and Settlement Help"
- "MCA Bank Levy and ACH Withdrawal Defense Help"
- "MCA UCC Lien Removal and Receivables Defense Help"

### Creditor / Commercial Litigation bucket

Suggested names:
- "Business Litigation and Creditor Defense Help"
- "Commercial Fraud Lawsuit Defense Help"
- "Breach of Contract Lawsuit Defense Help"
- "Partnership and Shareholder Dispute Help"

### Asset Protection / Bank Levy / UCC bucket

Suggested names:
- "Business Asset Protection and Creditor Defense Help"
- "Business Bank Levy Defense and Emergency Creditor Collection Help"
- "UCC Lien Defense and Removal Help"

---

## 5. Breadcrumb variants

Three-level breadcrumb. Pick parent based on page bucket.

### Bankruptcy bucket

```json
{
  "@type": "BreadcrumbList",
  "@id": "[URL]#breadcrumb",
  "itemListElement": [
    { "@type": "ListItem", "position": 1, "name": "Home", "item": "https://crediblelaw.com/" },
    { "@type": "ListItem", "position": 2, "name": "Bankruptcy and Debt Solutions", "item": "https://crediblelaw.com/bankruptcy-and-debt-solutions/" },
    { "@type": "ListItem", "position": 3, "name": "[PAGE TITLE]", "item": "[URL]" }
  ]
}
```

### MCA Defense bucket

Parent: `"Merchant Cash Advance Defense"` → `https://crediblelaw.com/mca-defense-attorney/`

### Creditor / Commercial Litigation bucket

Parent: `"Business Litigation"` → `https://crediblelaw.com/business-litigation/`

### Asset Protection bucket

Use whichever parent best fits the specific page topic (see SKILL.md classification guidance).

---

## 6. DefinedTerm full list

Each DefinedTerm follows this shape:

```json
{
  "@type": "DefinedTerm",
  "@id": "[URL]#<term-slug>",
  "name": "[Term name]",
  "description": "[Legally cautious description]",
  "inDefinedTermSet": { "@id": "[URL]#terms" },
  "url": "[optional — only if a confirmed Credible Law page covers this term]"
}
```

The catalog (use only the ones relevant to the page bucket — see section 8):

| Slug | Name | Description | URL (only if confirmed) |
|---|---|---|---|
| `business-bankruptcy` | Business bankruptcy | A legal process that may help businesses address overwhelming debt through reorganization or liquidation, subject to court approval and applicable legal requirements. | `https://crediblelaw.com/business-bankruptcy/` |
| `chapter-11-bankruptcy` | Chapter 11 bankruptcy | A bankruptcy process that may allow a business to reorganize debts while continuing operations, subject to court approval and applicable legal requirements. | `https://crediblelaw.com/business-bankruptcy/` |
| `subchapter-v-bankruptcy` | Subchapter V bankruptcy | A streamlined form of Chapter 11 designed for eligible small businesses, which may offer a faster and lower-cost reorganization path. | `https://crediblelaw.com/subchapter-v-bankruptcy-san-diego/` |
| `chapter-7-bankruptcy` | Chapter 7 bankruptcy | A bankruptcy process generally involving liquidation of non-exempt assets to pay creditors, subject to court approval and applicable legal requirements. | — |
| `automatic-stay` | Automatic stay | A court-ordered pause on most collection activities that may take effect when a bankruptcy case is filed, subject to exceptions under the Bankruptcy Code. | — |
| `debtor-in-possession` | Debtor in possession | A business that continues operating its assets and affairs during a Chapter 11 case, subject to court oversight and applicable legal requirements. | — |
| `reorganization-plan` | Reorganization plan | A proposed plan in a Chapter 11 or Subchapter V case that outlines how a business intends to address its debts, subject to creditor and court approval. | — |
| `business-debt-restructuring` | Business debt restructuring | A process that may involve renegotiating the terms of business debts to make them more manageable, which can occur inside or outside of bankruptcy. | — |
| `creditor-lawsuit` | Creditor lawsuit | A civil action filed by a creditor seeking payment, judgment, or other relief related to an alleged business debt. | — |
| `judgment-lien` | Judgment lien | A lien that may attach to property after a court enters a money judgment against a debtor, subject to applicable state and federal law. | — |
| `default-judgment` | Default judgment | A judgment that a court may enter against a defendant who fails to respond to a lawsuit within the required time, subject to applicable procedural rules. | — |
| `bank-levy` | Bank levy | A legal collection tool that may allow a creditor with a judgment to seize funds from a debtor's bank account, subject to applicable law and exemptions. | `https://crediblelaw.com/business-bank-levy-defense/` |
| `frozen-business-bank-account` | Frozen business bank account | A bank account on which transactions are restricted, often as a result of a levy, lien, or other legal process by a creditor. | `https://crediblelaw.com/business-bank-levy-defense/` |
| `ucc-lien` | UCC lien | A security interest in personal property of a business filed under the Uniform Commercial Code, often used by lenders and merchant cash advance companies. | `https://crediblelaw.com/mca-ucc-lien-removal/` |
| `ucc-1-financing-statement` | UCC-1 financing statement | A public filing that gives notice of a creditor's security interest in a debtor's personal property under the Uniform Commercial Code. | — |
| `merchant-cash-advance` | Merchant cash advance | A financing arrangement in which a business receives funds in exchange for a portion of future receivables, often structured outside traditional lending laws. | `https://crediblelaw.com/mca-defense-attorney/` |
| `mca-lawsuit` | MCA lawsuit | A civil action brought by a merchant cash advance company seeking payment, judgment, or enforcement against a business or its principals. | `https://crediblelaw.com/merchant-cash-advance-lawsuit-defense/` |
| `mca-collections` | MCA collections | Collection activities by a merchant cash advance company, which may include ACH withdrawals, lawsuits, UCC liens, bank levies, and judgment enforcement. | — |
| `confession-of-judgment` | Confession of judgment | A clause or document in which a party agrees in advance to entry of a judgment against them, the enforceability of which varies by state. | — |
| `business-asset-protection` | Business asset protection | Legal strategies that may help shield business assets from creditors, subject to applicable law and the specific facts of each case. | — |
| `accounts-receivable` | Accounts receivable | Amounts owed to a business by its customers for goods or services delivered, which may be subject to liens or other creditor claims. | `https://crediblelaw.com/ucc-lien-on-receivables/` |
| `commercial-litigation` | Commercial litigation | Civil litigation involving business disputes, contracts, partnerships, fraud claims, and related commercial matters. | `https://crediblelaw.com/business-litigation/` |
| `business-debt-settlement` | Business debt settlement | A negotiated resolution between a business and one or more creditors, which may reduce the amount owed or restructure payment terms. | — |

---

## 7. Thing entity full list

Each Thing follows this shape:

```json
{
  "@type": "Thing",
  "@id": "[URL]#<term-slug>",
  "name": "[Concept name]",
  "description": "[Short description]",
  "sameAs": [ /* optional, only authoritative sources */ ]
}
```

Always include the `#primary-topic` Thing, which is the page's main subject:

```json
{
  "@type": "Thing",
  "@id": "[URL]#primary-topic",
  "name": "[PRIMARY TOPIC — usually the H1 subject]",
  "description": "[1–2 sentence description of the main page topic]"
}
```

Then include additional Things from the catalog (use the same slugs as the matching DefinedTerm, where applicable):

| Slug | Name | Suggested sameAs |
|---|---|---|
| `chapter-11-bankruptcy` | Chapter 11 bankruptcy | `https://www.uscourts.gov/services-forms/bankruptcy`, `https://www.law.cornell.edu/uscode/text/11` |
| `subchapter-v-bankruptcy` | Subchapter V bankruptcy | `https://www.uscourts.gov/services-forms/bankruptcy`, `https://www.sba.gov/` |
| `automatic-stay` | Automatic stay | `https://www.law.cornell.edu/uscode/text/11` |
| `business-asset-protection` | Business asset protection | — |
| `business-debt-restructuring` | Business debt restructuring | — |
| `creditor-lawsuit` | Creditor lawsuit | — |
| `judgment-enforcement` | Judgment enforcement | — |
| `bank-levy` | Bank levy | — |
| `frozen-business-account` | Frozen business account | — |
| `ucc-lien` | UCC lien | `https://www.law.cornell.edu/ucc` |
| `merchant-cash-advance` | Merchant cash advance | `https://www.ftc.gov/business-guidance` |
| `mca-lawsuit` | MCA lawsuit | — |
| `mca-debt` | MCA debt | — |
| `commercial-litigation` | Commercial litigation | — |
| `business-debt-settlement` | Business debt settlement | — |

---

## 8. Topic-bucket → entity-inclusion map

Don't dump every term on every page. Pick the ones that match the page's bucket and content.

### Bankruptcy bucket — include

DefinedTerms: business-bankruptcy, chapter-11-bankruptcy, subchapter-v-bankruptcy, chapter-7-bankruptcy, automatic-stay, debtor-in-possession, reorganization-plan, business-debt-restructuring, business-asset-protection, business-debt-settlement

Things: primary-topic, chapter-11-bankruptcy, subchapter-v-bankruptcy, automatic-stay, business-asset-protection, business-debt-restructuring

### MCA Defense bucket — include

DefinedTerms: merchant-cash-advance, mca-lawsuit, mca-collections, ucc-lien, ucc-1-financing-statement, confession-of-judgment, default-judgment, bank-levy, frozen-business-bank-account, accounts-receivable, business-debt-settlement, business-asset-protection, automatic-stay (if bankruptcy is discussed), chapter-11-bankruptcy (if discussed), subchapter-v-bankruptcy (if discussed)

Things: primary-topic, merchant-cash-advance, mca-lawsuit, mca-debt, ucc-lien, bank-levy, frozen-business-account, business-asset-protection

### Creditor / Commercial Litigation bucket — include

DefinedTerms: creditor-lawsuit, judgment-lien, default-judgment, bank-levy, business-debt-restructuring, business-debt-settlement, business-asset-protection, commercial-litigation

Things: primary-topic, creditor-lawsuit, judgment-enforcement, bank-levy, commercial-litigation, business-asset-protection

### Asset Protection / Bank Levy / UCC bucket — include

DefinedTerms: business-asset-protection, bank-levy, frozen-business-bank-account, ucc-lien, ucc-1-financing-statement, judgment-lien, creditor-lawsuit, accounts-receivable, business-debt-restructuring

Things: primary-topic, business-asset-protection, bank-levy, frozen-business-account, ucc-lien, creditor-lawsuit
