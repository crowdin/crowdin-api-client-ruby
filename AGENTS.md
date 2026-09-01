# AGENTS.md

Ruby client for the Crowdin API v2 and Crowdin Enterprise API v2 (gem: `crowdin-api`, namespace `Crowdin`).

The gemspec requires Ruby >= 2.4 while CI tests 3.0–3.3 — stay conservative with syntax (no pattern matching, no endless methods).

## Layout

- `lib/crowdin-api.rb` — entry point; the `API_RESOURCES_MODULES` array plus requires
- `lib/crowdin-api/client/client.rb` — `Crowdin::Client`; mixes every resource module in
- `lib/crowdin-api/api_resources/<name>.rb` — one module per API resource, plain instance methods
- `lib/crowdin-api/core/` — request/response plumbing, errors, `fetch_all`, GraphQL
- `spec/api_resources/<name>_spec.rb` — 1:1 with resources; WebMock, no fixtures directory

## Commands

- Install: `bundle install`
- Test (all): `bundle exec rspec` (or `bundle exec rake`)
- Test (one file): `bundle exec rspec spec/api_resources/<name>_spec.rb`
- Lint (CI runs this before the specs): `bundle exec rubocop`
- Lint autofix: `bundle exec rubocop -a`

## Adding or changing an endpoint

Fetch the endpoint spec first (see Crowdin API reference below). Then:

1. Implement the method in `lib/crowdin-api/api_resources/<snake_case>.rb` (`# frozen_string_literal: true`, then `module Crowdin` > `module ApiResources` > `module <CamelCase>`):
   - Argument order: required path ids, then the `query`/`body` hash, then optional `destination` (file downloads), then `project_id = config.project_id` last. RuboCop caps optional parameters at 4 and this pattern already uses them all.
   - Guards: `project_id || raise_project_id_is_required_error`; Enterprise-only methods start with `enterprise_mode? || raise_only_for_enterprise_mode_error` and sit under a `# -- For Enterprise mode only --` comment.
   - Body: build `Web::Request.new(connection, :get, "#{config.target_api_url}/projects/#{project_id}/...", { params: query })` and return `Web::SendRequest.new(request).perform` (pass `destination` as the second argument to `SendRequest` for downloads).
   - Name list endpoints `list_*` — `fetch_all` refuses anything else (and hard-codes extra args for `list_terms` and `list_file_revisions` in `client.rb`).
   - Doc comment: two `{https://support.crowdin.com/developer/... API Documentation}` links (base and enterprise) plus YARD `@param` lines.
2. For a new resource, append the CamelCase symbol to `Crowdin::API_RESOURCES_MODULES` in `lib/crowdin-api.rb`. The file name must be the exact snake_case of that symbol: the require loop swallows `LoadError` silently and a mismatch surfaces later as an unrelated `NameError` from `const_get`. `client.rb` needs no edit — the include loop picks the module up.
3. Spec in `spec/api_resources/<snake_case>_spec.rb`: tag examples `:default` or `:enterprise` — `spec_helper.rb` prebuilds `@crowdin` and sets the WebMock host (`https://api.crowdin.com` vs `https://domain.api.crowdin.com`) from the tag. House idiom: `stub_request(...)` with no `.to_return`, then `expect(result).to eq(200)` — `perform` returns the HTTP status for an empty body, a parsed Hash otherwise, and an error String on failure (HTTP errors are returned, not raised).

A complete new resource touches exactly 3 files: the resource module, `lib/crowdin-api.rb`, and the spec.

## Crowdin API reference

Before implementing or changing any endpoint, fetch its spec from the llms.txt indexes (pick by environment, then project type):

- https://support.crowdin.com/_llms-txt/api/crowdin/file-based.txt — Crowdin API, file-based projects (start here)
- https://support.crowdin.com/_llms-txt/api/crowdin/string-based.txt — Crowdin API, string-based projects
- https://support.crowdin.com/_llms-txt/api/enterprise/file-based.txt — Crowdin Enterprise API, file-based projects
- https://support.crowdin.com/_llms-txt/api/enterprise/string-based.txt — Crowdin Enterprise API, string-based projects

Each index links one spec file per route (e.g. `.../api.projects.strings.get.txt`) with the exact request and response shapes.

## Conventions

- Conventional Commits for commit messages and PR titles; CI lints PR titles.
- PRs target `main`. CI runs RuboCop before the specs, so a lint failure blocks the test result.
- Keep the public API backward compatible.
- Never bump the version by hand — the Release workflow rewrites `lib/crowdin-api/client/version.rb`, the README install line, and `Gemfile.lock` together.

## PR checklist

A change is ready when:

1. `bundle exec rubocop` is clean,
2. `bundle exec rspec` passes,
3. every new or changed endpoint method has a spec (tagged `:default`, plus `:enterprise` where the API differs), and
4. every new or changed public method carries the two API documentation links.
