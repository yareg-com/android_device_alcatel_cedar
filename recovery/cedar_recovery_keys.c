#include <linux/input.h>

#include "common.h"
#include "extendedcommands.h"
#include "recovery_ui.h"

int device_handle_key(int key_code, int visible) {
    if (visible) {
        switch (key_code) {
            case KEY_VOLUMEDOWN:
                return SELECT_ITEM;

            case KEY_VOLUMEUP:
                return HIGHLIGHT_UP;
        }
    }

    return NO_ACTION;
}
