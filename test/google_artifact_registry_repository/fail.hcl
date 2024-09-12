mock "tfplan/v2" {
  module {
    source = "../../testdata/mock-google-artifact-registry-repository-fail.mock"
  }
}

test {
    rules = {
        main = false
    }
}