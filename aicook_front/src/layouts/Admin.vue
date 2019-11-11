<template>
  <div>
    <template>
      <q-layout view="hHh LpR fFf">
        <q-header reveal bordered class="bg-purple text-white" height-hint="98">
          <q-toolbar>
            <q-toolbar-title>
              <!-- <q-avatar>
                <img src="https://cdn.quasar.dev/logo/svg/quasar-logo.svg" />
              </q-avatar>-->
              <span class="q-ml-sm">AICook</span>
            </q-toolbar-title>
          </q-toolbar>

          <q-tabs align="left">
            <q-route-tab to="/admin" label="Résumé" />
            <q-route-tab to="/admin/recipes" label="Recettes" />
            <q-route-tab to="/admin/farms" label="Fermes" />
          </q-tabs>
        </q-header>

        <q-page-container>
          <router-view />
        </q-page-container>
      </q-layout>
    </template>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  }
};
</script>
  </div>
</template>
<script>
export default {
  data() {
    return {};
  }
};
</script>