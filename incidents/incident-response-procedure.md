# Basic Incident Response Procedure

This runbook is a learning aid for the NexaCore lab. In a real organisation, follow the approved incident response policy and escalation process.

## 1. Detect

- Record what triggered the investigation.
- Note the system, account, time, and alert/event ID.
- Preserve relevant logs and avoid unnecessary changes.

## 2. Investigate

- Check the event details and surrounding events.
- Confirm whether the activity is expected, accidental, or suspicious.
- Review affected accounts and systems.
- Record facts separately from assumptions.

## 3. Contain

- Choose a proportionate action based on evidence and authority.
- For a suspected compromised account, account disablement or password reset may be appropriate under the organisation's procedure.
- In a lab, record the action and verify its effect.

## 4. Remediate and recover

- Address the likely cause.
- Restore only what is needed.
- Verify normal operation and access.
- Re-enable lab accounts only after the exercise is complete and the state is confirmed.

## 5. Document and improve

- Record the timeline, evidence, actions, outcome, and lessons learned.
- Keep screenshots and exported logs sanitised.
- Identify a practical improvement, such as clearer alerting or a more repeatable audit.
