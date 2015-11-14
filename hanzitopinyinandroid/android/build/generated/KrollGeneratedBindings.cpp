/* C++ code produced by gperf version 3.0.3 */
/* Command-line: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/gperf -L C++ -E -t /private/var/folders/__/mmfwkhqd5_n26398pwwl85sr0000gn/T/johcha/hanzitopinyinandroid-generated/KrollGeneratedBindings.gperf  */
/* Computed positions: -k'' */

#line 3 "/private/var/folders/__/mmfwkhqd5_n26398pwwl85sr0000gn/T/johcha/hanzitopinyinandroid-generated/KrollGeneratedBindings.gperf"


#include <string.h>
#include <v8.h>
#include <KrollBindings.h>

#include "com.app.hanzitopinyin.HanzitopinyinandroidModule.h"
#include "com.app.hanzitopinyin.ExampleProxy.h"


#line 14 "/private/var/folders/__/mmfwkhqd5_n26398pwwl85sr0000gn/T/johcha/hanzitopinyinandroid-generated/KrollGeneratedBindings.gperf"
struct titanium::bindings::BindEntry;
/* maximum key range = 15, duplicates = 0 */

class HanzitopinyinandroidBindings
{
private:
  static inline unsigned int hash (const char *str, unsigned int len);
public:
  static struct titanium::bindings::BindEntry *lookupGeneratedInit (const char *str, unsigned int len);
};

inline /*ARGSUSED*/
unsigned int
HanzitopinyinandroidBindings::hash (register const char *str, register unsigned int len)
{
  return len;
}

struct titanium::bindings::BindEntry *
HanzitopinyinandroidBindings::lookupGeneratedInit (register const char *str, register unsigned int len)
{
  enum
    {
      TOTAL_KEYWORDS = 2,
      MIN_WORD_LENGTH = 34,
      MAX_WORD_LENGTH = 48,
      MIN_HASH_VALUE = 34,
      MAX_HASH_VALUE = 48
    };

  static struct titanium::bindings::BindEntry wordlist[] =
    {
      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
      {""}, {""}, {""}, {""}, {""}, {""}, {""},
#line 17 "/private/var/folders/__/mmfwkhqd5_n26398pwwl85sr0000gn/T/johcha/hanzitopinyinandroid-generated/KrollGeneratedBindings.gperf"
      {"com.app.hanzitopinyin.ExampleProxy", ::com::app::hanzitopinyin::hanzitopinyinandroid::ExampleProxy::bindProxy, ::com::app::hanzitopinyin::hanzitopinyinandroid::ExampleProxy::dispose},
      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
      {""}, {""}, {""}, {""},
#line 16 "/private/var/folders/__/mmfwkhqd5_n26398pwwl85sr0000gn/T/johcha/hanzitopinyinandroid-generated/KrollGeneratedBindings.gperf"
      {"com.app.hanzitopinyin.HanzitopinyinandroidModule", ::com::app::hanzitopinyin::HanzitopinyinandroidModule::bindProxy, ::com::app::hanzitopinyin::HanzitopinyinandroidModule::dispose}
    };

  if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
    {
      unsigned int key = hash (str, len);

      if (key <= MAX_HASH_VALUE)
        {
          register const char *s = wordlist[key].name;

          if (*str == *s && !strcmp (str + 1, s + 1))
            return &wordlist[key];
        }
    }
  return 0;
}
#line 18 "/private/var/folders/__/mmfwkhqd5_n26398pwwl85sr0000gn/T/johcha/hanzitopinyinandroid-generated/KrollGeneratedBindings.gperf"

