import { LightningElement, track, wire } from 'lwc';
import { NavigationMixin, CurrentPageReference } from 'lightning/navigation';
import { fireEvent } from 'c/pubsub';
import searchAccommodationByWord from '@salesforce/apex/AccommodationController.searchAccommodationByWord';

export default class AccommodationSearchBar extends NavigationMixin(LightningElement) {
    @track searchWord = '';

    @track accommodations;

    @wire(CurrentPageReference) pageRef;

    @wire(searchAccommodationByWord, {searchWord: '$searchWord'})
    loadAccommodations({ error, data}) {
        this.accommodations = data;
        if (data) {
            fireEvent(this.pageRef, 'accommodationListUpdate', data);
        }
    }

    handleSearchWordChange(event) {
		window.clearTimeout(this.delayTimeout);
        const { value: searchWord } = event.target;
        // eslint-disable-next-line @lwc/lwc/no-async-operation
		this.delayTimeout = setTimeout(() => {
			this.searchWord = searchWord;
        }, 300);
	}
}