resource "yandex_vpc_network" "network1" {
    name = "Network Project"
}

resource "yandex_vpc_subnet" "subnet1" {
    description = "Subnet Project"
    v4_cidr_blocks = ["10.10.10.0/24"]
    zone = "ru-central1-a"
    network_id = yandex_vpc_network.network1.id
}

data "yandex_compute_image" "my_image" {
  image_id = "fd8bu9gsckcm2351kqaq"
}

#VM1
resource "yandex_compute_instance" "vm" {
  name                      = "vm1"
  allow_stopping_for_update = true
  zone                      = "ru-central1-a"
  resources {

    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.my_image.id
      size     = 20
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id      = yandex_vpc_subnet.subnet1.id
    nat            = true
  }
  metadata = {
    user-data = "${file("meta.txt")}"
  }
  scheduling_policy {
    preemptible = true
  }
}