function detect_theme_dark
  set condition (gsettings get org.gnome.desktop.interface color-scheme)
  set condition (echo "$condition" | tr -d "[:space:]'")
  if test $condition = "prefer-dark"
    true
  end
  false
end
