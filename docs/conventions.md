# Summary
The following are conventions for contributing to the modules.

## Resource Naming Conventions

Resource names should use snake case. `my_project` for example, instead of `my-project`

**Correct**
```
resource "google_project" "my_project" {
  name       = "My Project"
  project_id = "your-project-id"
  org_id     = "1234567"
}
```

**Incorrect**
```
resource "google_project" "my-project" {
  name       = "My Project"
  project_id = "your-project-id"
  org_id     = "1234567"
}
```

## Module Layout
The module folder is setup and currently has infrastructure for Google Cloud under the gcp folder. Each folder inside contains the terraform for each module. Each module folder should have at min. the following:
- variables.tf
- main.tf

## Alphabetized Variable names
Variable names should be alphabetized. This ensures easy identification when locating more information in code about the variable.

## Variable match resource names
If the variable is intended to be used as a parameter for a resource field, it should have the same name as the resource field. This eliminates confusion when passing in arguments to modules.

## Variable description
Each variable should have a description of what it's purpose is.

## Module Documentation
Each module should include a README.md. This file should include:
- IAM required for resource
- Required googleapis enabled
- Link to the resource documentation in terraform

In the README.md there should be a **Summary** section that clearly defines what the module is doing.

Each README.md file should also contain a usage example of how to use the module.

## Assignment spacing
Assignment spacing should confirm to equal spacing from the assignment operator on with the assigment operator aligned for each field in the resource.

