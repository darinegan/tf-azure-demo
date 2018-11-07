package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformModuleEmptyResourceGroup(t *testing.T) {
	t.Parallel()

	expectedName := "foo"

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../modules/empty-resource-group",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"name": expectedName,
		},

		NoColor: true,
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	actualName := terraform.Output(t, terraformOptions, "name")

	// Verify we're getting back the variable we expect
	assert.Equal(t, expectedName, actualName)
}
