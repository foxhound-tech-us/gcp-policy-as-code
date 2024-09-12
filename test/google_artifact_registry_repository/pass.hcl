mock "tfplan/v2" {
  module {
    source = "../../testdata/mock-google-artifact-registry-repository-pass.mock"
  }
}

test {
    rules = {
        main = true
    }
}