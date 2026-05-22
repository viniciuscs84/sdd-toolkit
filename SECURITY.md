# Security Guidance

Before publishing or reusing a customized version of this toolkit, review the files carefully.

## Do not publish

- access credentials
- API keys
- private repository URLs
- client names
- internal product rules that should remain private
- local machine paths
- production configuration values
- logs containing personal or business data

## Recommended review process

1. Review every file under `opencode/` before publishing.
2. Replace project-specific names with neutral examples.
3. Replace real domains and URLs with placeholders.
4. Keep workflow rules generic unless they are intentionally public.
5. Review agent instructions for accidental business context.
6. Run a repository scan using your preferred security tool before making changes public.

## Responsible use

This toolkit helps AI agents plan, implement and review software work. It does not replace human responsibility for architecture, security, licensing or production releases.
