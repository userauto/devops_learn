resource "yandex_vpc_network" "network-swarm" {
  name = "network-swarm"
}

resource "yandex_vpc_subnet" "subnet-swarm" {
  name           = "subnet-swarm"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-swarm.id
  v4_cidr_blocks = ["10.10.10.0/24"]
}

resource "yandex_compute_instance" "manager" {

  name                      = "swarm-manager"
  allow_stopping_for_update = true
  platform_id               = "standard-v1"
  zone                      = "ru-central1-a"

  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8vljd295nqdaoogf3g"
    }
  }

   network_interface {
    subnet_id = yandex_vpc_subnet.subnet-swarm.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.yml")}"
  }

  scheduling_policy {
    preemptible = true
  }
}

resource "yandex_compute_instance" "worker-1" {

  name                      = "swarm-worker-1"
  allow_stopping_for_update = true
  platform_id               = "standard-v1"
  zone                      = "ru-central1-a"

  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8vljd295nqdaoogf3g"
    }
  }

   network_interface {
    subnet_id = yandex_vpc_subnet.subnet-swarm.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.yml")}"
  }
  
  scheduling_policy {
    preemptible = true
  }
}

resource "yandex_compute_instance" "worker-2" {

  name                      = "swarm-worker-2"
  allow_stopping_for_update = true
  platform_id               = "standard-v1"
  zone                      = "ru-central1-a"

  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8vljd295nqdaoogf3g"
    }
  }

   network_interface {
    subnet_id = yandex_vpc_subnet.subnet-swarm.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.yml")}"
  }
  
  scheduling_policy {
    preemptible = true
  }
}
