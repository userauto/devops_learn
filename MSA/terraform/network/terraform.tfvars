#=========== main ==============
cloud_id  = "b1gao98a7hlpttth939v"
folder_id = "b1gpnhho5vqgdin7nli5"

#=========== network ==============
network_name = "mynet"

#=========== subnet ==============
subnets = {
  "k8s_masters" = [
    {
      name = "k8s_master_zone_a"
      zone = "ru-central1-a"
      cidr = ["10.0.1.0/28"]
    },
    {
      name = "k8s_master_zone_b"
      zone = "ru-central1-b"
      cidr = ["10.0.2.0/28"]
    },
    {
      name = "k8s_master_zone_c"
      zone = "ru-central1-c"
      cidr = ["10.0.3.0/28"]
    }
  ],
  "k8s_workers" = [
    {
      name = "k8s_worker_zone_a"
      zone = "ru-central1-a"
      cidr = ["10.0.4.0/28"]
    },
    {
      name = "k8s_worker_zone_b"
      zone = "ru-central1-b"
      cidr = ["10.0.5.0/28"]
    },
    {
      name = "k8s_worker_zone_c"
      zone = "ru-central1-c"
      cidr = ["10.0.6.0/28"]
    }
  ],
}
