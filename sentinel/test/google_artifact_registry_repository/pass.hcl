mock "tfplan/v2" {
  module {
    source = "../../testdata/mock-google-artifact-registry-repository-pass.sentinel"
  }
}

test {
    rules = {
        main = true
    }
}