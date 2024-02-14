terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = file("./authorized_key.json")
  cloud_id                 = "b1gao98a7hlpttth939v"
  folder_id                = "b1gpnhho5vqgdin7nli5"
  zone                     = "ru-central1-a"
}
