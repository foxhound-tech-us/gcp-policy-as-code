mock "tfplan/v2" {
  module {
    source = "../../testdata/mock-ensure-allowed-root-resource-or-module-fail.sentinel"
  }
}

test {
    rules = {
        main = false
    }
}