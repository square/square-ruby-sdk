## Dispute Evidence

### Structure

`DisputeEvidence`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `evidence_id` | `String` | Optional | The Square-generated ID of the evidence. |
| `dispute_id` | `String` | Optional | The ID of the dispute the evidence is associated with. |
| `uploaded_at` | `String` | Optional | The time when the next action is due, in RFC 3339 format. |
| `evidence_type` | [`String (Dispute Evidence Type)`](/doc/models/dispute-evidence-type.md) | Optional | Type of the dispute evidence. |

### Example (as JSON)

```json
{
  "evidence_id": null,
  "dispute_id": null,
  "uploaded_at": null,
  "evidence_type": null
}
```

