var text = "BEGIN:VCARD\n\
N:Heidenreich;Lena\n\
URL:heidenreich-osteopathie.de\n\
EMAIL:info@heidenreich-osteopathie.de\n\
TEL:+49 0157 58812637\n\
ADR:;;Brunckhorstweg 11;Hamburg;;22525\n\
END:VCARD";

new QRCode("qrcode", {
  text: text,
  width: 192,
  height: 192,
  colorDark : "#000000",
  colorLight : "#fed136",
  correctLevel : QRCode.CorrectLevel.L
});
