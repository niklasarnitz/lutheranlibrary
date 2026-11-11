\version "2.24.3"
% Scan 173, Collecte no. 2, complete prayer (Braunschweig-Lüneburg et al.).
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score { <<
 \new Staff { \new Voice = "chant" { \clef treble \cadenzaOn \omit Stem \slurUp
  g'2 g'2 f'2( g'2) g'\breve \bar "||" e'\breve f'2 f'2 f'2 f'2 e'2 f'\breve^\markup \tiny \italic "Halbpunkt." \bar "|" e'2 f'2 f'2 \break
  f'2 f'2 e'2 g'2 g'\breve^\markup \tiny \italic "Hauptpunkt." \bar "|" e'2 f'2 e'2 g'\breve \bar "|" e'2 f'2 f'2 f'2 f'2 e'2 g'2 g'\breve^\markup \tiny \italic "Hauptpunkt." \break
  e'2 f'2 f'2 f'2 f'2 f'2 f'2 e'2 g'2 g'\breve \bar "|" e'2 f'2 f'2 f'2 f'2 f'2 \break
  f'2 f'\breve f'\breve f'\breve f'\breve e'2( fis'2) g'2 g'2 g'\breve \bar "||" }
 }
 \new Lyrics \lyricsto "chant" { Laßt uns be __ ten! All -- mäch -- ti -- ger HEr -- re Gott, weck uns auf, \break daß wir be -- reit sein, wenn dein Sohn kommt, ihn mit Freu -- den zu em -- pfa -- hen, \break und dir mit rei -- nem Her -- zen zu die -- nen, durch den -- sel -- ben dei -- nen \break Sohn, JE -- sum Chri -- stum, un __ sern HEr -- ren. }
>> \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-2 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } } }
