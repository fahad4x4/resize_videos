# resize_videos

**Batch-resize every MP4 video in a folder to half its size with ffmpeg, without touching the originals.**

![Shell: Bash](https://img.shields.io/badge/shell-Bash-4EAA25?logo=gnubash&logoColor=white)
![Requires: ffmpeg](https://img.shields.io/badge/requires-ffmpeg-007808?logo=ffmpeg&logoColor=white)
![License: Apache 2.0](https://img.shields.io/badge/license-Apache%202.0-blue)

[English](#english) | [العربية](#arabic)

---

<a id="english"></a>

## English

### Overview

`resize_videos.sh` scales down all `.mp4` videos in the current folder to half their width and height using ffmpeg. The resized copies are saved under the same file names in a `resized` subfolder; the original videos are left unchanged.

### What it does

1. **Checks for ffmpeg.** If `ffmpeg` is not installed, it prints `ffmpeg is not installed` and exits.
2. **Finds the videos.** It collects every `*.mp4` file in the current folder (case-insensitive, so `.MP4` is included too; subfolders are not searched). If there are none, it prints `No mp4 files found in this folder` and exits.
3. **Creates the output folder** `./resized` (no error if it already exists).
4. **Resizes each video** to half its width, keeping the aspect ratio. Width and height are rounded to even numbers, which the H.264 codec requires. The command used is:
   `ffmpeg -nostdin -loglevel error -y -i "$file" -vf "scale=trunc(iw/4)*2:-2" "resized/$file"`
5. **Saves the result** as `resized/<original name>`. Because of `-y`, re-running the script overwrites earlier copies in `resized` instead of stopping to ask.

### Requirements

- Bash
- [ffmpeg](https://ffmpeg.org/)

On Debian/Ubuntu, for example:

```bash
sudo apt install ffmpeg
```

### Installation

```bash
git clone https://github.com/fahad4x4/resize_videos.git
cd resize_videos
chmod +x resize_videos.sh
```

### Usage

Run the script from inside the folder that holds your videos (no `sudo` needed):

```bash
cd /path/to/your/videos
/path/to/resize_videos/resize_videos.sh
```

Or copy `resize_videos.sh` into that folder and run:

```bash
./resize_videos.sh
```

The resized videos appear in `./resized`.

### Project structure

```
resize_videos/
├── resize_videos.sh   # The resize script
├── README.md          # This file
└── LICENSE            # Apache License 2.0
```

### License

This project is licensed under the [Apache License 2.0](LICENSE).

### Author

**Fahad ALGhathbar**, GitHub: [@fahad4x4](https://github.com/fahad4x4)

---

<a id="arabic"></a>

## العربية

<div dir="rtl">

### نظرة عامة

يقوم السكربت `resize_videos.sh` بتصغير جميع مقاطع الفيديو بصيغة `.mp4` الموجودة في المجلد الحالي إلى نصف عرضها وارتفاعها باستخدام ffmpeg. تُحفَظ النسخ المصغّرة بالأسماء نفسها داخل مجلد فرعي باسم `resized`، وتبقى مقاطع الفيديو الأصلية دون تغيير.

### ماذا يفعل

1. **التحقق من وجود ffmpeg:** إذا لم يكن `ffmpeg` مثبتًا، يطبع رسالة بذلك ثم يخرج.
2. **البحث عن مقاطع الفيديو:** يجمع كل ملفات `*.mp4` في المجلد الحالي (دون تمييز بين الأحرف الكبيرة والصغيرة، فتُشمل ملفات `.MP4` أيضًا، ولا يبحث في المجلدات الفرعية). إذا لم يجد أي ملف، يطبع رسالة بذلك ثم يخرج.
3. **إنشاء مجلد الإخراج** `./resized` (دون خطأ إذا كان موجودًا مسبقًا).
4. **تصغير كل مقطع** إلى نصف عرضه مع الحفاظ على نسبة الأبعاد، وتقريب العرض والارتفاع إلى أعداد زوجية كما يتطلب ترميز H.264. الأمر المستخدم:
   `ffmpeg -nostdin -loglevel error -y -i "$file" -vf "scale=trunc(iw/4)*2:-2" "resized/$file"`
5. **حفظ النتيجة** باسم `resized/<الاسم الأصلي>`. وبسبب الخيار `-y`، فإن إعادة تشغيل السكربت تستبدل النسخ السابقة في `resized` بدلًا من التوقف للسؤال.

### المتطلبات

- Bash
- [ffmpeg](https://ffmpeg.org/)

على Debian أو Ubuntu مثلًا:

```bash
sudo apt install ffmpeg
```

### التثبيت

```bash
git clone https://github.com/fahad4x4/resize_videos.git
cd resize_videos
chmod +x resize_videos.sh
```

### الاستخدام

شغّل السكربت من داخل المجلد الذي يحتوي على مقاطع الفيديو (لا حاجة إلى `sudo`):

```bash
cd /path/to/your/videos
/path/to/resize_videos/resize_videos.sh
```

أو انسخ `resize_videos.sh` إلى ذلك المجلد ثم شغّله:

```bash
./resize_videos.sh
```

ستجد المقاطع المصغّرة في المجلد `./resized`.

### هيكل المشروع

```
resize_videos/
├── resize_videos.sh   # سكربت التصغير
├── README.md          # هذا الملف
└── LICENSE            # رخصة Apache 2.0
```

### الرخصة

هذا المشروع مرخّص بموجب [رخصة Apache 2.0](LICENSE).

### المؤلف

**فهد الغثبر (Fahad ALGhathbar)**، على GitHub: [@fahad4x4](https://github.com/fahad4x4)

</div>
