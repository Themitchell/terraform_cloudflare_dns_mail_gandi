locals {
  dmarc_mailto = var.dmarc_email == null ? "" : "rua=mailto:${var.dmarc_email};"
}

module "mail_records" {
  source = "git@github.com:Themitchell/terraform_cloudflare_dns_mail"

  zone_id = var.zone_id

  mail_servers = [
    "spool.mail.gandi.net.",
    "fb.mail.gandi.net."
  ]

  dmarc = "v=DMARC1; p=reject; pct=100; adkim=s; aspf=s; ${local.dmarc_mailto}"
  spf   = "v=spf1 include:_mailcust.gandi.net ~all"

  domain_keys = {
    "gm1._domainkey" = "gm1.gandimail.net."
    "gm2._domainkey" = "gm2.gandimail.net."
    "gm3._domainkey" = "gm3.gandimail.net."
  }

  ttl = var.ttl
}

resource "cloudflare_record" "imap" {
  zone_id = var.zone_id
  name    = "imap"
  type    = "CNAME"
  ttl     = var.ttl
  value   = "access.mail.gandi.net."
}

resource "cloudflare_record" "mail" {
  zone_id = var.zone_id
  name    = "mail"
  type    = "CNAME"
  ttl     = var.ttl
  value   = "mail.gandi.net."
}

resource "cloudflare_record" "pop" {
  zone_id = var.zone_id
  name    = "pop"
  type    = "CNAME"
  ttl     = var.ttl
  value   = "access.mail.gandi.net."
}

resource "cloudflare_record" "smtp" {
  zone_id = var.zone_id
  name    = "smtp"
  type    = "CNAME"
  ttl     = var.ttl
  value   = "relay.mail.gandi.net."
}

resource "cloudflare_record" "webmail" {
  zone_id = var.zone_id
  name    = "webmail"
  type    = "CNAME"
  ttl     = var.ttl
  value   = "webmail.gandi.net."
}
