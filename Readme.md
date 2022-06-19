# Terraform state - AWS
Infrastructure for storing Terraform state files and lock states remotely in AWS.
## Example
This is an example of how the backend configuration could be defined in a workspace.
``` hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "=4.19.0"
    }
  }
  backend "s3" {
   encrypt = true
   bucket = "callofthevoid-terraform-statefiles"
   dynamodb_table = "terraform-statefile-locks"
   region = "eu-central-1"
   key = "example.tfstate"
 }
}
```
## Unlocking locked state files
If we need to unlock a locked state file we can use the `terraform force-unlock <LOCK_ID>` command.<br/>
This is necessary if we create a permanent lock if for example we press ctrl+c during a plan.
As we can see in this screenshot we have found the lock id in the dynamodb table which we will now copy.
<br/>
<center>
![Screenshot](https://raw.githubusercontent.com/rbjoergensen/tf-state-aws/master/.github/images/example.png?raw=true)
</center>
<br/>
We can then run the command `terraform force-unlock 590d2293-05eb-92d6-f5f9-6ffe907c9b2c --force` and our state will be unlocked again.
<br/>
<center>
![Screenshot](https://raw.githubusercontent.com/rbjoergensen/tf-state-aws/master/.github/images/unlock.png?raw=true)
</center>
