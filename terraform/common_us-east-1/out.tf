output "acm_squaaat_root" {
  value = {
    arn = module.acm_squaaat_root.acm.arn
    id = module.acm_squaaat_root.acm.id
  }
}

output "acm_squaaat_sub" {
  value = {
    arn = module.acm_squaaat_sub.acm.arn
    id = module.acm_squaaat_sub.acm.id
  }
}
