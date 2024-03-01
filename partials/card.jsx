import React from "react";

import styles from '@/styles/card.module.css'

export default class Card extends React.Component {
    /**
     * 
     * @param {import("react").ComponentProps} props 
     */
    constructor(props) {
        super(props);
        this.props = props;
        this.description = this.props.description ?? "DESCRIPTION"
    }

    render() {
        return (
            <div className={styles.card}>
                <header>
                    <h1>{this.props.title}</h1>
                </header>
                <main>
                    <h2>{this.description}</h2>
                </main>
                <footer>
                    <h2>META</h2>
                </footer>
            </div>
        );
    }

}