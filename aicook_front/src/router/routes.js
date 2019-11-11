const routes = [{
    path: '/',
    component: () => import('layouts/MyLayout.vue'),
    children: [{
      path: '',
      component: () => import('pages/Index.vue')
    }]
  },
  {
    path: '/admin',
    component: () => import('layouts/Admin.vue'),
    children: [{
        name: 'adminHome',
        path: '',
        component: () => import('pages/admin/Index.vue')
      },
      {
        name: 'adminRecipes',
        path: 'recipes',
        component: () => import('pages/admin/Recipes.vue')
      },
      {
        name: 'adminRecipesDetails',
        path: 'recipes/:id',
        component: () => import('pages/admin/RecipesDetails.vue')
      },
      {
        name: 'adminFarms',
        path: 'farms',
        component: () => import('pages/admin/Index.vue')
      },
    ]
  },

]

// Always leave this as last one
if (process.env.MODE !== 'ssr') {
  routes.push({
    path: '*',
    component: () => import('pages/Error404.vue')
  })
}

export default routes
