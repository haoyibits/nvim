return {
    "L3MON4D3/LuaSnip",
    config = function()
        local ls = require("luasnip")
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node

        require("luasnip.loaders.from_vscode").lazy_load()  -- 兼容 VSCode 片段

        ls.add_snippets("c", {
            s("osinclude", {
                t({
                    "#include <stdio.h>",
                    "#include <stdlib.h>",
                    "#include <unistd.h>",
                    "#include <time.h>",
                    "#include <sys/wait.h>",
                    "#include <sys/types.h>",
                    "#include <sys/ipc.h>",
                    "#include <sys/shm.h>",
                    "#include <sys/stat.h>",
                    "#include <fcntl.h>",
                    "#include <errno.h>",
                    "#include <string.h>",
                    "#include <sys/mman.h>",
                    "#include <semaphore.h>",
                    "#include <pthread.h>",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("kmodplan", {
                t({
                    "// Kernel Module Plan: Memory-Mapped Device with ioctl Interface",
                    "//",
                    "// [General Logic]",
                    "// - Define hardware base address and register layout.",
                    "// - Implement ioctl with copy_from_user() to receive user config.",
                    "// - Encode config into register format; use iowrite32() to apply.",
                    "// - Setup file_operations with unlocked_ioctl().",
                    "//",
                    "// [init() Function Steps]",
                    "// - Register a major number using register_chrdev().",
                    "// - Create device class with class_create().",
                    "// - Create device node with device_create().",
                    "// - ioremap() hardware memory region.",
                    "// - Handle errors with cleanup: destroy device/class, unregister.",
                    "// - Return 0 if success, or error code on failure.",
                    "//",
                    "// [exit() Function]",
                    "// - Unmap memory with iounmap().",
                    "// - Destroy device and class.",
                    "// - Unregister character device.",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("oskernelinclude", {
                t({
                    "#include <linux/atomic.h>",
                    "#include <linux/cdev.h>",
                    "#include <linux/delay.h>",
                    "#include <linux/device.h>",
                    "#include <linux/fs.h>",
                    "#include <linux/init.h>",
                    "#include <linux/io.h>",
                    "#include <linux/module.h>",
                    "#include <linux/printk.h>",
                    "#include <linux/types.h>",
                    "#include <linux/uaccess.h>",
                    "#include <linux/version.h>",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("ioctlhdr", {
                t({
                    "#ifndef DEVICE_IOCTL_H",
                    "#define DEVICE_IOCTL_H",
                    "",
                    "#include <linux/ioctl.h>",
                    "#include <linux/types.h>",
                    "",
                    "// Configuration structure passed from userspace to kernel",
                    "struct device_config {",
                    "    uint8_t enable;",       -- Replace or add your fields
                    "    uint8_t mode;",
                    "    uint8_t level;",
                    "};",
                    "",
                    "#define DEVICE_IOCTL_MAGIC  0xF1",
                    "#define DEVICE_IOCTL_CONFIG _IOW(DEVICE_IOCTL_MAGIC, 0, struct device_config)",
                    "",
                    "#endif // DEVICE_IOCTL_H",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("threadplan", {
                t({
                    "// Parse inputs (e.g., array size, thread count).",
                    "// Allocate data and thread info structs.",
                    "// Divide work among threads (start/end indices).",
                    "// Create threads with pthread_create().",
                    "// Each thread does its chunk of work.",
                    "// Join threads with pthread_join().",
                    "// Combine partial results if needed.",
                    "// Free memory and exit.",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("procsemplan", {
                t({
                    " // Use mmap() to share unnamed semaphores.",
                    " // sem_init() with value 0 to block dependent steps.",
                    " // fork() to create processes A, B, C.",
                    " // Use sem_post/sem_wait to enforce execution order.",
                    " // Parent waits and then cleans up.",
                    ""
                })
            }),
        })
        ls.add_snippets("make", {
            s("kernelmake", {
                t({
                    "obj-m += my_module.o",
                    "",
                    "KDIR := /lib/modules/$(shell uname -r)/build",
                    "PWD  := $(shell pwd)",
                    "",
                    "all:",
                    "\tmake -C $(KDIR) M=$(PWD) modules",
                    "",
                    "clean:",
                    "\trm -f *.o *.ko *.mod.* *.symvers *.order",
                    ""
                })
            }),
        })
        ls.add_snippets("c", {
            s("osmain", {
                t({
                    "int main(int argc, char *argv[])",
                    "{",
                    "\t"
                }),
                i(1), -- Insert node where the cursor will be placed
                t({
                    "",
                    "\treturn 0;",
                    "}"
                })
            }),
        })
    end,
    dependencies = { "rafamadriz/friendly-snippets" },
}