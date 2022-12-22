<template>
    <div class="footer">
        <div class="news-letter">
            <h3>Receive event notifications</h3>
            <form onsubmit="event.preventDefault();">
                <input type="email" name="useremailreceiveinfo" placeholder="enter your email"
                    id="useremailreceiveinfo">
                <input type="submit" value="subscribe">
            </form>
        </div>

        <div class="box-container">

            <div class="box">
                <h3>our menu</h3>
                <router-link @click="scrollToTop()" to="/menu"><i class="fas fa-arrow-right"></i> Al-Faham</router-link>
                <router-link @click="scrollToTop()" to="/menu"><i class="fas fa-arrow-right"></i> Fruit Shakes</router-link>
                <router-link @click="scrollToTop()" to="/menu"><i class="fas fa-arrow-right"></i> Lime</router-link>
                <router-link @click="scrollToTop()" to="/menu"><i class="fas fa-arrow-right"></i> Mojito
                </router-link>
                <router-link @click="scrollToTop()" to="/menu"><i class="fas fa-arrow-right"></i> Snacks</router-link>
                <router-link @click="scrollToTop()" to="/menu"><i class="fas fa-arrow-right"></i> Manthi</router-link>
            </div>

            <div class="box">
                <h3>quick links</h3>
                <router-link @click="scrollToTop()" to="/"> <i class="fas fa-arrow-right"></i> home</router-link>
                <router-link @click="scrollToTop()" to="/about"> <i class="fas fa-arrow-right"></i> about</router-link>
                <router-link @click="scrollToTop()" to="/menu"> <i class="fas fa-arrow-right"></i> menu</router-link>
                <router-link @click="scrollToTop()" to="/table"> <i class="fas fa-arrow-right"></i> book a table
                </router-link>
            </div>

            <div class="box">
                <h3>extra links</h3>
                <div v-if="user">
                    <router-link @click="scrollToTop()" to="/cart"> <i class="fas fa-arrow-right"></i> my order
                    </router-link>
                    <router-link @click="scrollToTop()" to="/myorder"> <i class="fas fa-arrow-right"></i> my orders
                    </router-link>
                </div>
                <div v-else>
                    <router-link @click="scrollToTop()" to="/login"> <i class="fas fa-arrow-right"></i> login
                    </router-link>
                    <router-link @click="scrollToTop()" to="/register"> <i class="fas fa-arrow-right"></i> register
                    </router-link>
                </div>
            </div>

            <div class="box">
                <h3>opening hours</h3>
                <p>everyday : 8:00am to 9:00pm</p>

            </div>

        </div>

        <div class="bottom">

            <div class="share">
                <a href="#" class="fab fa-facebook-f"></a>
                <a href="#" class="fab fa-twitter"></a>
                <a href="#" class="fab fa-instagram"></a>
                <a href="#" class="fab fa-pinterest"></a>
            </div>

        </div>

    </div>
</template>

<script>
import { mapState } from 'vuex'
export default {
    name: 'FooterComponent',

    computed: {
        ...mapState(['user'])
    },

    methods: {
        scrollToTop() {
            window.scrollTo(0, 0);
        }
    }
}
</script>

<style scoped>
/* footer */
.footer {
    background: #f7f7f7;
    padding: 2rem 9%;
}

.footer .news-letter {
    text-align: center;
    margin-bottom: 2rem;
}

.footer .news-letter h3 {
    font-size: 2.5rem;
    color: #130f40;
    padding-bottom: 1rem;
}

.footer .news-letter form {
    max-width: 70rem;
    margin: 1rem auto;
    max-width: 70rem;

    display: flex;
    border-radius: .5rem;
    overflow: hidden;
}

.footer .news-letter form input[type="email"] {
    height: 100%;
    width: 100%;
    padding: 1rem 1.2rem;
    font-size: 1.6rem;
    color: #130f40;
    text-transform: none;
}

.footer .news-letter form input[type="submit"] {
    padding: 0 2rem;
    font-size: 1.6rem;
    color: rgb(11, 11, 11);
    background: #ec50cd;
    cursor: pointer;
}

.footer .news-letter form input[type="submit"]:hover {
    background: #2e1ceb;
}

.footer .box-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(20rem, 1fr));
    gap: 1.5rem;
}

.footer .box-container .box h3 {
    font-size: 2.2rem;
    color: #130f40;
    padding: 1rem 0;
}

.footer .box-container .box p {
    font-size: 1.4rem;
    color: #666;
    padding: 1rem 0;
}

.footer .box-container .box a {
    display: block;
    font-size: 1.4rem;
    color: #666;
    padding: 1rem 0;
}

.footer .box-container .box a:hover {
    color: #f64141;
}

.footer .box-container .box a:hover i {
    padding-right: 2rem;
}

.footer .box-container .box a i {
    padding-right: .5rem;
    color: #f23252;
}

.footer .bottom {
    padding-top: 1rem;
    text-align: center;
}

.footer .bottom .share {
    margin: 1.5rem 0;
}

.footer .bottom .share a {
    height: 4.5rem;
    width: 4.5rem;
    line-height: 4.5rem;
    font-size: 2rem;
    border-radius: .5rem;
    margin: 0 .3rem;
    color: #fff;
    background: #f12b49;
}

.footer .bottom .share a:hover {
    background: #5547f2;
}

@media (max-width: 576px) {
    .footer .box-container {

        grid-template-columns: repeat(auto-fit, minmax(15rem, 1fr));

    }

}
</style>