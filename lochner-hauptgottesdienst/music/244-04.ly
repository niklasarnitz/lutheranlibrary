\version "2.24.3"
% Lochner, II. Sanctus minus summum. Source pages 219–220.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
global = { \key f \major \time 4/4 \accidentalStyle forget }

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne d''2 c''2 \bar "|" f''2 d''2 \bar "|" c''1 \bar "|" c''2^\markup \tiny "Gemeinde." a'4 bes'4 \bar "|" c''2 g'4 a'4 \bar "|" f'2( g'2) \bar "|" f'2 f'2 \bar "|" }
      \new Voice = "alto" { \voiceTwo bes'2 a'2 a'2 g'2 e'1 e'2 f'4 f'4 e'2 e'4 c'4 d'2.( e'4) f'2 f'2 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t HErr Gott Ze -- ba "oth!" Voll sind die Him -- mel und Er \skip 1 de von }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne f'2 f'2 c'2( b!4) b4 c'1 c'2 f4 f4 g2 c'4 a4 a2( bes2) a2 d'2 }
      \new Voice = "bass" { \voiceTwo bes,2 f2 f2 g2 c1 c2 d4 d4 c2 c4 f4 d2( g,2) d2 d2 }
    >>
  \new Lyrics \lyricsto "bass" { \set ignoreMelismata = ##t der HErr \skip 1 \skip 1 \skip 1 Voll sind \skip 1 Him -- mel und Erd \skip 1 reich }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
