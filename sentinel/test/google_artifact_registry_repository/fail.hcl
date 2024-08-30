mock "tfplan/v2" {
  module {
    source = "../../testdata/mock-google-artifact-registry-repository-fail.sentinel"
  }
}

test {
    rules = {
        main = false
    }
}