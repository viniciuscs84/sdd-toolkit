# Configuration

This folder contains optional configuration files for adapting the SDD Toolkit to a project or platform.

## Model routing

Use `model-routing.example.yml` as a starting point for assigning model profiles to agents.

The toolkit does not define fixed model names because model availability depends on:

- the platform being used
- the user's subscription
- the provider configured in the project
- cost limits
- compliance and data policies

## Recommended process

1. Copy `config/model-routing.example.yml` into the target project.
2. Rename it to `config/model-routing.yml` or the platform-specific name required by your tooling.
3. Replace placeholder model names with models available in your subscription.
4. Review agent-to-profile assignments.
5. Adjust routing rules for cost, latency, accuracy and risk.
6. Do not commit private provider tokens or credentials.

## Profile idea

The example uses these profiles:

- `economical`: simple and low-risk work.
- `fast`: routing and simple classification.
- `standard`: balanced day-to-day work.
- `reasoning`: planning, architecture and complex reasoning.
- `high_assurance`: security, acceptance, final review and high-risk decisions.

These are logical profiles, not provider-specific model names.

## Human decision required

When model names are unknown, unavailable or cost-sensitive, agents should ask the human instead of guessing.
