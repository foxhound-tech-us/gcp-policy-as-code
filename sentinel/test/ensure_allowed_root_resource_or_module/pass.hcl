mock "tfplan/v2" {
  module {
    source = "../../testdata/mock-ensure-allowed-root-resource-or-module-pass.sentinel"
  }
}

test {
    rules = {
        main = true
    }
}