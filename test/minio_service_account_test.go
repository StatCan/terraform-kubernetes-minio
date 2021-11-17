package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/assert"
)

// Test using test_structure, which allows sections of the tests to be skipped
// if a `SKIP_stage_name=true` environment variable is set.  This allows for
// selectively skipping long running test steps like terraform apply/destroy.
func TestAdminUserClusterRole(t *testing.T) {
	t.Parallel()

	workingDir := "../examples/minio-service-account"

	expectedNamespace := "minio-system"

	terraformOptions := &terraform.Options{
		TerraformDir: workingDir,
	}
	test_structure.SaveTerraformOptions(t, workingDir, terraformOptions)

	// Destroy
	defer test_structure.RunTestStage(t, "destroy", func() {
		terraformOptions := test_structure.LoadTerraformOptions(t, workingDir)
		terraform.Destroy(t, terraformOptions)
	})

	// Apply
	test_structure.RunTestStage(t, "apply", func() {
		terraformOptions := test_structure.LoadTerraformOptions(t, workingDir)
		terraform.InitAndApply(t, terraformOptions)

		namespace := terraform.OutputRequired(t, terraformOptions, "helm_namespace")

		assert.Equal(t, expectedNamespace, namespace)
	})
}
