## List Dispute Evidence Response

Defines fields in a ListDisputeEvidence response.

### Structure

`ListDisputeEvidenceResponse`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `evidence` | [`Array<Dispute Evidence Hash>`](/doc/models/dispute-evidence.md) | Optional | The list of evidence previously uploaded to the specified dispute. |
| `errors` | [`Array<Error Hash>`](/doc/models/error.md) | Optional | Information on errors encountered during the request. |

### Example (as JSON)

```json
{
  "evidence": null,
  "errors": null
}
```

