/**
	* Sample React Native App
	* https://github.com/facebook/react-native
	*
	* @format
	*/

import React from 'react';
import type {PropsWithChildren} from 'react';
import {
	SafeAreaView,
	StatusBar,
	StyleSheet,
	Text,
	TouchableOpacity,
	useColorScheme,
	View,
} from 'react-native';

import {
	Colors,
} from 'react-native/Libraries/NewAppScreen';
import { NativeModules } from 'react-native';

const { AirDropModule } = NativeModules;



function App(): React.JSX.Element {
	const isDarkMode = useColorScheme() === 'dark';

	const backgroundStyle = {
		backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
	};
	const shareDeepLink = () => {
		const deepLink = 'https://example.com/your-deep-link'; // Replace with your deep link
		AirDropModule.shareDeepLink(deepLink);
	};

	return (
		<SafeAreaView>
			<StatusBar
				barStyle={'default'}
				backgroundColor={backgroundStyle.backgroundColor}
			/>
			<View style={{alignItems:'center'}}>
			<TouchableOpacity style={styles.button} onPress={shareDeepLink}>
				<Text style={styles.buttonTxt}>Share With NameDrop</Text>
			</TouchableOpacity>
      </View>
	</SafeAreaView>
	);
}

const styles = StyleSheet.create({

	button:{
		backgroundColor:'#243642',
		padding: 16,
		width: '80%',
		alignItems: 'center',
		borderRadius: 50,
		marginTop:'80%'
	},
	buttonTxt:{
		color: '#fff'
	}
});

export default App;
