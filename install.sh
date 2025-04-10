#!/bin/sh

# ====================================================================
#  تحذير خطير جدًا!
#  هذا السكريبت سيقوم بتنزيل سكريبت إعادة ضبط المصنع ثم تشغيله فورًا.
#  تشغيل هذا السكريبت سيؤدي مباشرة إلى حذف جميع إعدادات جهازك.
#  لا تقم بتشغيله إلا إذا كنت متأكدًا تمامًا وتفهم العواقب.
# ====================================================================

echo "********************************************************************"
echo "* تحذير خطير: هذا السكريبت سيقوم بتنزيل وتشغيل إعادة الضبط فورًا!  *"
echo "* سيتم حذف جميع الإعدادات والقنوات والإضافات بشكل دائم.             *"
echo "* اضغط CTRL+C الآن فورًا للإلغاء إذا كنت غير متأكد.                *"
echo "* أمامك 10 ثوانٍ للإلغاء قبل المتابعة التلقائية...                  *"
echo "********************************************************************"
sleep 10

echo "[-] جاري المتابعة..."

# متغيرات لتسهيل القراءة
RESET_SCRIPT_URL="https://raw.githubusercontent.com/MARKETTV1/reset/refs/heads/main/factory_reset.sh"
RESET_SCRIPT_PATH="/tmp/factory_reset.sh"

# الخطوة 1: تنزيل سكريبت إعادة الضبط
echo "[1/3] جاري تنزيل سكريبت إعادة الضبط من الرابط..."
wget -O "$RESET_SCRIPT_PATH" "$RESET_SCRIPT_URL"

# التحقق من نجاح التنزيل
if [ $? -ne 0 ]; then
  echo "[خطأ] فشل تنزيل السكريبت من الرابط. تأكد من اتصال الإنترنت وصحة الرابط."
  exit 1 # الخروج مع رمز خطأ
fi
echo "[نجاح] تم تنزيل السكريبت بنجاح."

# الخطوة 2: إعطاء صلاحيات التنفيذ للسكريبت الذي تم تنزيله
echo "[2/3] جاري إعطاء صلاحيات التنفيذ للسكريبت..."
chmod +x "$RESET_SCRIPT_PATH"

# التحقق من نجاح تغيير الصلاحيات
if [ $? -ne 0 ]; then
  echo "[خطأ] فشل في إعطاء صلاحيات التنفيذ للملف $RESET_SCRIPT_PATH."
  # يمكنك إضافة أمر لحذف الملف الذي تم تنزيله إذا فشلت هذه الخطوة
  # rm -f "$RESET_SCRIPT_PATH"
  exit 1 # الخروج مع رمز خطأ
fi
echo "[نجاح] تم منح صلاحيات التنفيذ."

# الخطوة 3: تنفيذ سكريبت إعادة الضبط الذي تم تنزيله
echo "[3/3] !!! سيتم الآن تنفيذ سكريبت إعادة الضبط فورًا !!!"
echo "---------------- بدء تنفيذ سكريبت إعادة الضبط ----------------"
sh "$RESET_SCRIPT_PATH"
echo "---------------- تمت محاولة تنفيذ سكريبت إعادة الضبط ----------------"
# عادةً، سكريبت إعادة الضبط يحتوي على أمر إعادة التشغيل (reboot)
# لذا قد لا يصل هذا السكريبت إلى سطر الخروج التالي.

exit 0
