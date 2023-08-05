local utils = require('user.snippets.utils')

-- <script setup>

-- </script>

-- <template>

-- </template>

-- <style >

-- </style>

return {
    utils.snip("tssfc", {
        utils.text({ "<script lang=\"ts\" setup>", ""}),
        utils.insert(1),
        utils.text({ "", "</script>", "", "" }),
        utils.text({ "<template>", "" }),
        utils.insert(3),
        utils.text({ "", "</template>", "" }),
        utils.text({ "", "<style" }),
        utils.insert(2),
        utils.text({ ">", "" }),
        utils.insert(4),
        utils.text({ "", "</style>" }),
    }),


    utils.snip("ssfc", {
        utils.text({ "<script setup>", ""}),
        utils.insert(1),
        utils.text({ "", "</script>", "", "" }),
        utils.text({ "<template>", "" }),
        utils.insert(3),
        utils.text({ "", "</template>", "" }),
        utils.text({ "", "<style" }),
        utils.insert(2),
        utils.text({ ">", "" }),
        utils.insert(4),
        utils.text({ "", "</style>" }),
    }),

    utils.snip("sfcd", {
        utils.text({ "<script>", "" }),
        utils.text({ "import { defineComponent } from 'vue'", "", "" }),
        utils.text({ "export default defineComponent({", "" }),
        utils.text("\tname: '"),
        utils.insert(1),
        utils.text({ "',", "})", "" }),
        utils.text({ "</script>", "", "" }),
        utils.text({ "<template>", "" }),
        utils.insert(3),
        utils.text({ "", "</template>", "" }),
        utils.text({ "", "<style" }),
        utils.insert(2),
        utils.text({ ">", "" }),
        utils.insert(4),
        utils.text({ "", "</style>" }),
    }),

    utils.snip("sfc", {
        utils.text({ "<script>", "" }),
        utils.text({ "export default {", "" }),
        utils.text("\tname: '"),
        utils.insert(1),
        utils.text({ "',", "}", "" }),
        utils.text({ "</script>", "", "" }),
        utils.text({ "<template>", "" }),
        utils.insert(3),
        utils.text({ "", "</template>", "" }),
        utils.text({ "", "<style" }),
        utils.insert(2),
        utils.text({ ">", "" }),
        utils.insert(4),
        utils.text({ "", "</style>" }),
    }),
}
