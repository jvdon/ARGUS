import React from "react";

import styles from '@/styles/card.module.css'

export default class Card extends React.Component {
    render() {
        return (
            <div className={styles.card}>
                <header>
                    <h1>Hello</h1>
                </header>
                <main>
                    <h2>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsam odit, voluptate cum dicta id minima architecto sint possimus, repudiandae aliquam illum. Illum similique exercitationem accusamus, dignissimos possimus assumenda. Sit, dolore!</h2>
                </main>
                <footer>
                    <h2>CARD</h2>
                </footer>
            </div>
        );
    }

}