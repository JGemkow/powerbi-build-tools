# Task: Power BI Update Dataset Parameters

## Overview

Updates the parameters for a dataset

## Schema

```
- task: PowerBIUpdateDatasetParameters@1
  displayName: {string}
  inputs:
    connection: {string}
    workspace: {string}
    name: {string}
    datasetParameters: {multiLine}
```

## Inputs

| Name | Label | Required | Type | Description
|------|-------|----------|------|------------
| Connection | Power BI connection | True | string | The service connection to Power BI.
| Workspace | Workspace | False | string | The ID or name of the workspace. If not specified, your personal workspace will be used.
| DatasetId | Dataset Id | True | string | The ID or name of the dataset
| DatasetParameters | Dataset Parameters | False | multiLine | Dataset Parameters in JSON format. The keys are the names of the parameters.  The values are the parameter values.
