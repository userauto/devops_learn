resource "yandex_vpc_network" "project6-net" {
    name = "Network for Project-6"
}

resource "yandex_vpc_subnet" "project6-a" {
    description = "Network for Project-6"
    v4_cidr_blocks = ["10.10.10.0/24"]
    zone = "ru-central1-a"
    network_id = yandex_vpc_network.project6-net.id
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
      size     = 10
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id      = yandex_vpc_subnet.project6-a.id
    nat            = true
  }
  metadata = {
    user-data = "${file("meta.txt")}"
  }
  
  scheduling_policy {
    preemptible = true
  }
}

#VM2
resource "yandex_compute_instance" "vm2" {
  name                      = "vm2"
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
      size     = 10
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id      = yandex_vpc_subnet.project6-a.id
    nat            = true
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }

  scheduling_policy {
    preemptible = true
  }
}

#VM3
resource "yandex_compute_instance" "vm3" {
  name                      = "vm3"
  allow_stopping_for_update = true
  zone                      = "ru-central1-a"
  
  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8qs4k9kv4rdj5mgq02"
      size     = 10
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id      = yandex_vpc_subnet.project6-a.id
    nat            = true
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }

  scheduling_policy {
    preemptible = true
  }
}



