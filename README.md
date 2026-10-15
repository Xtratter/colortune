# Colortune

Small GUI utility to adjust **gamma** and **saturation** of the screen on **KDE Plasma 6 (Wayland)** — a rough equivalent of the NVIDIA Control Panel colour sliders for AMD/Intel GPUs, where `xgamma`/`xrandr --gamma`, `gammastep` and `redshift` do not work under Wayland.

[Русская версия ниже](#русский)

## How it works

KWin has no gamma-ramp protocol, but it does support per-output ICC profiles. Colortune generates a tiny matrix/TRC ICC profile on the fly:

- **gamma** — the tone curve of the profile (values below 1.0 darken midtones, as in `xgamma`/NVIDIA; above 1.0 brighten);
- **saturation** — primaries are moved relative to the white point so that colours are pushed away from grey, luminance is preserved.

The profile is applied with `kscreen-doctor`, so KWin stores it in its own output config and it **persists across reboots**. A new file (`colortune-0.icc` / `colortune-1.icc`, alternating) is written on each change so that KWin reloads it.

## Requirements

- KDE Plasma 6 (`kscreen-doctor` from `libkscreen`)
- Python 3 and PyQt5 (`python-pyqt5` on Arch/Manjaro)

No other dependencies.

## Install

```sh
git clone https://github.com/Xtratter/colortune
cd colortune
sudo make install          # or: make install PREFIX=~/.local
```

Arch/Manjaro: a `PKGBUILD` is included (`makepkg -si`).

## Usage

```sh
colortune            # open the GUI
colortune --apply    # re-apply saved settings, no GUI
colortune --version
```

- Sliders apply changes live; `−` / `+` change the value by 0.01 (hold to repeat).
- **Reset** switches the output back to the plain sRGB profile.
- Settings are saved to `~/.config/colortune.json`, generated profiles live in `~/.local/share/icc/`. Do not delete them while the profile is active.
- Settings are per output; pick the screen in the drop-down.

## Limitations

- Only the ICC path of KWin is used: HDR mode is not affected (HDR has its own ICC setting).
- Saturation above 1.0 clips colours that are already saturated.
- X11 sessions are not the target — use `xrandr --gamma` there.

## License

MIT

---

## Русский

Небольшая утилита с ползунками **гаммы** и **насыщенности** для **KDE Plasma 6 (Wayland)** — аналог цветовых настроек панели NVIDIA для AMD/Intel, где под Wayland не работают `xgamma`, `gammastep` и `redshift`.

Утилита на лету создаёт маленький ICC-профиль (кривая тона + смещённые первичные цвета) и применяет его к экрану через `kscreen-doctor`. KWin сохраняет его в своём конфиге, поэтому настройки **остаются после перезагрузки**.

**Установка:** `sudo make install` (или `make install PREFIX=~/.local`). Нужны KDE Plasma 6, Python 3 и PyQt5. Для Arch/Manjaro есть `PKGBUILD`.

**Запуск:** `colortune` — окно с ползунками; `colortune --apply` — применить сохранённые значения без окна. Кнопки `−`/`+` меняют значение на 0,01. Гамма ниже 1.0 затемняет полутона (как в NVIDIA/xgamma).
