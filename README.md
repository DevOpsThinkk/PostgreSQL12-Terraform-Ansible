## Infrastructure is created with Terraform and provisioned with Ansible.

AWS requires credentials in the form of access key id and secret access key. Both Terraform and Ansible may use shared credentials file ~/.aws/credentials, so it has to be configured.

    AWS_ACCESS_KEY_ID="AKIA22KGDGACMAFGBRUG"
    AWS_SECRET_ACCESS_KEY="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"

The other best method is, If you are running the terraform script from linux machine then export credentials like below, instead of hardcoding the access and secret key inside the provider.tf file.

    export AWS_ACCESS_KEY_ID="AKIA22KGDGACMAFGBRUG"
    export AWS_SECRET_ACCESS_KEY="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"
    export AWS_DEFAULT_REGION="us-west-2"

