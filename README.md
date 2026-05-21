# invarn fixture: ios-spm

A minimal SwiftUI iOS app, SPM-only (no CocoaPods, no Carthage), with one unit test target. Used by [invarnhq/templates](https://github.com/invarnhq/templates) curated templates that target the iOS stack without CocoaPods.

This is a standalone fixture repo — the matching curated template targets this repo at root, the same shape as a customer-connected iOS app.

## What's checked in

- `project.yml` — [XcodeGen](https://github.com/yonaskolb/XcodeGen) project spec. Source of truth.
- `IosSpmDemo.xcodeproj/` — generated from `project.yml` and **committed** so the matching curated template's iOS detector can recognize this repo as an iOS project at clone time. Regenerate locally if it drifts from `project.yml`.
- `IosSpmDemo/` — SwiftUI app source (~20 LOC).
- `IosSpmDemoTests/` — one XCTestCase with passing tests.

## What's NOT checked in

- `xcuserdata/` — per-user Xcode state. Gitignored.
- `DerivedData/`, `.build/`, `build/` — Xcode build output. Gitignored.

## Regenerate the project locally

If you change `project.yml`, rebuild the `.xcodeproj` and commit the result:

```bash
xcodegen generate
git add IosSpmDemo.xcodeproj
```

You'll need [XcodeGen](https://github.com/yonaskolb/XcodeGen) installed (`brew install xcodegen`).

## Build it locally

```bash
xcodebuild -project IosSpmDemo.xcodeproj -scheme IosSpmDemo -destination 'platform=iOS Simulator,OS=latest,name=iPhone 17' build test
```

## Which curated templates target this fixture

- `ios-pr-gate` — `requires_when: { pods: true }` drops the deps step, leaving build + test green against this fixture.
- `ios-coverage` (future) — same shape, coverage flag set.

## Properties

- ≤ 500 LOC of hand-written source (the `.xcodeproj` is generated).
- ≤ 3-minute clean build on the standard macOS runner.
- No external dependencies. No `Package.resolved` to drift.
- Single scheme (`IosSpmDemo`).
- One test target (`IosSpmDemoTests`).
