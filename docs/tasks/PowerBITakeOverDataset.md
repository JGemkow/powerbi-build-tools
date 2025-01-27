# Task: Power BI Take Over Dataset

## Overview

Takes over ownership for a dataset

## Schema

```
- task: PowerBITakeOverDataset@1
  displayName: {string}
  inputs:
    connection: {string}
    workspace: {string}
    name: {string}
```

## Inputs

| Name | Label | Required | Type | Description
|------|-------|----------|------|------------
| Connection | Power BI connection | True | string | The service connection to Power BI.
| Workspace | Workspace | False | string | The ID or name of the workspace. If not specified, your personal workspace will be used.
| DatasetId | Dataset Id | True | string | The ID or name of the dataset
