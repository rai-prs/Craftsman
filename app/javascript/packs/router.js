
import { createRouter, createWebHistory} from 'vue-router'
import UsersNewPage from "../pages/UsersNewPage"

Vue.use(Router)


const routes = [
  { path: '/', component: Index },
  { path: '/users/sign_up', component: UsersNewPage },
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})
