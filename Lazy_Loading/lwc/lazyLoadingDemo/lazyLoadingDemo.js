import { LightningElement, track, wire } from 'lwc';
import getAccounts from '@salesforce/apex/LazyLoadingController.getAccounts';

const columns = [
    { label: 'Id', fieldName: 'Id', type: 'text' },
    { label: 'Name', fieldName: 'Name', type: 'text'},
    { label: 'Rating', fieldName: 'Rating', type: 'text'}
  
];

export default class LazyLoadingDemo extends LightningElement {
    accounts=[];
    error;
    columns = columns;
    rowLimit =50;
    rowOffSet=0;
  
    /*connectedCallback() {
        this.loadData();
    }*/

    async loadData(){
        return await getAccounts({ limitSize: this.rowLimit , offset : this.rowOffSet })
        .then(result => {
            let updatedRecords = [...this.accounts, ...result];
            this.accounts = updatedRecords;
            this.error = undefined;
        })
        .catch(error => {
            this.error = error;
            this.accounts = undefined;
        });
    }

    async loadMoreData(event) {
        //const currentRecord = this.accounts;
        const { target } = event;
        target.isLoading = true;

        console.log('rowOffset:', this.rowOffset);
        this.rowOffSet += this.rowLimit;
        console.log('rowOffset:', this.rowOffset);
        await this.loadData()
            .then(()=> {
                target.isLoading = false;
            });   
    }


}